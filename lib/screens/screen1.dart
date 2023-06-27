import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oneloc_case/screens/login.dart';
import 'package:oneloc_case/screens/register.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Center(
                    //alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/onelocbusiness_logo.svg',
                          semanticsLabel: 'My SVG Image',
                        ),
                      ],
                    ),
                  ),
                ),
                const Flexible(
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Müşterilerinize ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            TextSpan(
                              text: 'mekanınızla',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                  fontSize: 35),
                            ),
                            TextSpan(
                                text: ' daha kolay erişin.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      // here element passing to the detail page element contain index other details
                                      LoginScreen()));
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          child: Text(
                            "Yeni Hesap Oluştur",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFFF0076FF)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        // here element passing to the detail page element contain index other details
                                        RegisterScreen()));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: const Text(
                              "Giriş yap",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          // here element passing to the detail page element contain index other details
                                          LoginScreen()));
                            },
                          ),
                        ],
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Oneloc’un mobil uygulamasına giriş yapan kullanıcılar ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Gizlilik Politikası',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: '’na ve ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Şartlar ve Koşullar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: '’a tabidir.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
