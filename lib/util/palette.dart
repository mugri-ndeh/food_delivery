import 'package:flutter/material.dart';

class Palette {
  static Color primaryGreen = const Color(0XFFF8774A);
  static Color secondaryColor = Color.fromARGB(255, 240, 155, 124);

  static Color scaffoldBg = const Color(0XFFFBF6F0);
  static Color borderGreen = const Color.fromARGB(255, 0, 17, 8);
  static Color white = Color(0xFFFFFFFF);
  static const MaterialColor primarySwatchColor = MaterialColor(
    0XFFF8774A, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
}
