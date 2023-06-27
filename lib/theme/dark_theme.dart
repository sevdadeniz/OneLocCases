import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF2F2F2F),
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    secondary: Color(0xFFF525252), //textfield background
    primary: Color(0XFFF0076FF),
    onPrimary: Color(0xFFFFD0000),
    onSecondary: Color(0xFFFFFFFF),
    tertiary: Color(0xFFFFFFFF),
    onTertiary: Color(0xFFFFD0000),
  ), //textcolor
);
