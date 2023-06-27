import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2F2F2F),
  ),
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    // ignore: use_full_hex_values_for_flutter_colors
    secondary: Color(0xFFF525252), //textfield background
    // ignore: use_full_hex_values_for_flutter_colors
    primary: Color(0XFFF0076FF),
    // ignore: use_full_hex_values_for_flutter_colors
    onPrimary: Color(0xFFFFD0000),
    onSecondary: Color(0xFFFFFFFF),
    tertiary: Color(0xFFFFFFFF),
    // ignore: use_full_hex_values_for_flutter_colors
    onTertiary: Color(0xFFFFD0000),
  ), //textcolor
);
