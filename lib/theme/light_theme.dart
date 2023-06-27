import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  colorScheme: ColorScheme.light(
    background: Color(0xFFFEDEDED),
    secondary: Color(0xFFFCECECE),
    primary: Color(0XFFF0076FF),
    onPrimary: Colors.black,
    onTertiary: Color(0xFFFFD0000),
    onSecondary: Color(0xFFF525252),
    tertiary: Color(0xFFFFFFFF),
  ), //textcolor
);
