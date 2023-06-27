import 'package:flutter/material.dart';
import 'package:oneloc_case/screens/screen1.dart';
import 'package:oneloc_case/theme/dark_theme.dart';
import 'package:oneloc_case/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OneLoc',
        theme: lightTheme,
        darkTheme: darkTheme,
        // splash screen geçiş hatası düzeltilecek
        home: const Scaffold(
          body: IntroScreen(),
        ));
  }
}
