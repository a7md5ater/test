import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color offWhite = Color(0xffF7F7F7); // light background
  static const red = Colors.red;
  static Color lightRed = Colors.red.withOpacity(0.6);
  static const Color black = Color(0xff1A1A1A); // dark background
  static const Color grey = Color(0xff6D6D6D); // caption
  static const Color secondGrey = Color(0xff7D7D7D); // textfield hint
  static const Color lightGrey =
      Color(0xff2C2C2C); // button grey , textfield background
  static const Color darkGrey = Color(0xff555555); // profile icons
  static const Color primary = Color(0xff4FBE9E); // primary
  static const Color blur = Color(0xff658182); // primary
  static const Color darkBlue = Colors.indigo; // for button background

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
