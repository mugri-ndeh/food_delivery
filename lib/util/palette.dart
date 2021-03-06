import 'package:flutter/material.dart';

class Palette {
  static Color primaryColor = const Color(0XFFF8774A);
  static Color buttonColor = const Color(0XFFF8774A);

  static Color secondaryColor = const Color.fromARGB(255, 240, 155, 124);

  static Color scaffoldBg = const Color(0XFFFBF6F0);
  static Color borderColor = const Color.fromARGB(255, 0, 17, 8);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color grey = Colors.grey;

  static const MaterialColor primarySwatchColor = MaterialColor(
    0XFFF8774A, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
}
