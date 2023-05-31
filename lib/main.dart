import 'package:google_fonts/google_fonts.dart';
import 'module/spotify/navigation_bar.dart';
import 'module/spotify/static/color.dart';
import 'state_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      darkTheme: ThemeData(
        appBarTheme:  AppBarTheme(backgroundColor:MyColor.black ),
        useMaterial3: true,
      brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: MyColorScheme.darkColorScheme,
      ),
      themeMode: ThemeMode.dark,
      home: const NavBarSpotify(),
    );
  }
}
