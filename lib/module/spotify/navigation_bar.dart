import 'package:flutter/material.dart';
import 'package:slicing_spotify/core.dart';
import 'package:slicing_spotify/module/spotify/static/color.dart';

class NavBarSpotify extends StatefulWidget {
  const NavBarSpotify({Key? key}) : super(key: key);

  @override
  State<NavBarSpotify> createState() => _NavBarSpotifyState();
}

class _NavBarSpotifyState extends State<NavBarSpotify> {
  int selectedIndex = 0;
  updateIndex(int newIndex) => setState(() => selectedIndex = newIndex);

  List<Widget> views = [
    const SpotifyHome(),
    const SpotifySearch(),
    const SpotifyKoleksi(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: views,
        ),
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          currentIndex: selectedIndex,
          onTap: (newIndex) => updateIndex(newIndex),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: MyColor.white,
          unselectedItemColor: MyColor.white.withOpacity(.3),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          // elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_sharp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search),
              label: "Cari",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined),
              activeIcon: Icon(Icons.library_music),
              label: "Koleksi Kamu",
            ),
          ],
        ),
      ),
    );
  }
}
