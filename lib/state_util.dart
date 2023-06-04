import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:slicing_spotify/module/spotify/static/color.dart';

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentContext;
  }

  static to(Widget page) async {
   await PersistentNavBarNavigator.pushNewScreen(
      navigatorKey.currentContext!,
      screen: page,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );

    // await navigatorKey.currentState!.push(
    //   MaterialPageRoute(builder: (context) => page),
    // );
  }

  static back() {
    navigatorKey.currentState!.pop(currentContext);
  }

  static offAll(page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.width;
  }
}

extension ChangeNotifierExtension on State {
  update() {
    // ignore: invalid_use_of_visible_for_testing_member, unnecessary_this, invalid_use_of_protected_member
    this.setState(() {});
  }
}

class MvcController {}

class MyColorScheme {
  static ColorScheme darkColorScheme = ColorScheme(
    primary: const Color(0xFFABCDEF), // Darker shade of primary color
    secondary: const Color(0xFFFF0000), // Darker shade of secondary color
    surface: const Color(
        0xFF121212), // Surface color (background color of cards, sheets, etc.)
    background: MyColor.black, // Background color
    error: const Color(0xFFFF0000), // Error color
    onPrimary: const Color(0xFFFFFFFF), // Text and icon color on primary color
    onSecondary:
        const Color(0xFF000000), // Text and icon color on secondary color
    onSurface: const Color(0xFFFFFFFF), // Text and icon color on surface color
    onBackground:
        const Color(0xFFFFFFFF), // Text and icon color on background color
    onError: const Color(0xFFFFFFFF), // Text and icon color on error color
    brightness: Brightness.dark,
  ); // Set the brightness to dark
}
