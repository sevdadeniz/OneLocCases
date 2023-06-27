import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  colorScheme: const ColorScheme.light(
    // ignore: use_full_hex_values_for_flutter_colors
    background: Color(0xFFFEDEDED),
    // ignore: use_full_hex_values_for_flutter_colors
    secondary: Color(0xFFFCECECE),
    // ignore: use_full_hex_values_for_flutter_colors
    primary: Color(0XFFF0076FF),
    onPrimary: Colors.black,
    // ignore: use_full_hex_values_for_flutter_colors
    onTertiary: Color(0xFFFFD0000),
    // ignore: use_full_hex_values_for_flutter_colors
    onSecondary: Color(0xFFF525252),
    tertiary: Color(0xFFFFFFFF),
  ), //textcolor
);
