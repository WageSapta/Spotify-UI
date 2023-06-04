import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'static/color.dart';
import 'widget/text_costum.dart';

class NavBarSpotify extends StatefulWidget {
  const NavBarSpotify({Key? key}) : super(key: key);

  @override
  State<NavBarSpotify> createState() => _NavBarSpotifyState();
}

class _NavBarSpotifyState extends State<NavBarSpotify> {
  int selectedIndex = 0;
  updateIndex(int newIndex) => setState(() => selectedIndex = newIndex);
  final _controller = PersistentTabController(initialIndex: 0);

  final List<Widget> _views = [
    const SpotifyHome(),
    const SpotifySearch(),
    const SpotifyKoleksi(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.spotify, size: 30),
          SizedBox(height: 10),
          TextCostum(
            text: "Purchase Premium",
            size: 20,
            color: Colors.white,
          ),
        ],
      ),
    )
  ];

  final List<PersistentBottomNavBarItem> _navBar = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_outlined),
      inactiveIcon: const Icon(Icons.home_sharp),
      activeColorPrimary: MyColor.grey,
      activeColorSecondary: MyColor.grey,
      inactiveColorPrimary: MyColor.grey.withOpacity(.5),
      inactiveColorSecondary: MyColor.grey.withOpacity(.5),
      textStyle: const TextStyle(fontSize: 10),
      title: "Home",
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      inactiveIcon: const Icon(Icons.search),
      title: "Cari",
      activeColorPrimary: MyColor.grey,
      activeColorSecondary: MyColor.grey,
      inactiveColorPrimary: MyColor.grey.withOpacity(.5),
      inactiveColorSecondary: MyColor.grey.withOpacity(.5),
      textStyle: const TextStyle(fontSize: 10),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.library_music),
      inactiveIcon: const Icon(Icons.library_music),
      title: "Koleksi Kamu",
      activeColorPrimary: MyColor.grey,
      activeColorSecondary: MyColor.grey,
      inactiveColorPrimary: MyColor.grey.withOpacity(.5),
      inactiveColorSecondary: MyColor.grey.withOpacity(.5),
      textStyle: const TextStyle(fontSize: 10),
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(FontAwesomeIcons.spotify),
      inactiveIcon: const FaIcon(FontAwesomeIcons.spotify),
      title: "Premium",
      activeColorPrimary: MyColor.grey,
      activeColorSecondary: MyColor.grey,
      inactiveColorPrimary: MyColor.grey.withOpacity(.5),
      inactiveColorSecondary: MyColor.grey.withOpacity(.5),
      textStyle: const TextStyle(fontSize: 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _views,
      items: _navBar,
      popAllScreensOnTapAnyTabs: true,
      confineInSafeArea: true,
      backgroundColor: MyColor.black,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      stateManagement: false,
      navBarStyle: NavBarStyle.style6,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      decoration: NavBarDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColor.black.withOpacity(.7),
            MyColor.black.withOpacity(.8),
            MyColor.black.withOpacity(.9),
            MyColor.black,
            MyColor.black,
          ],
        ),
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
    );
  }
}
