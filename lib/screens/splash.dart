import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oneloc_case/screens/screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF2F2F2F),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: SvgPicture.asset(
              'images/splash_icon.svg',
            ),
          ),
          SvgPicture.asset(
            'images/splash_logo.svg',
          ),
        ]),
      ),
    );
  }
}
