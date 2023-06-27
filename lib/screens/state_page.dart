import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oneloc_case/screens/login.dart';

import 'deleted_account.dart';

class StatePage extends StatefulWidget {
  const StatePage({super.key});

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: Image.asset(
              'images/oneloc_icon_appBar.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60.0),
                    child: SvgPicture.asset(
                      'images/onelocimg_vector.svg',
                      semanticsLabel: 'My SVG Image',
                    ),
                  ),
                  Text(
                    "Bilgilerin inceleniyor",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 40),
                    child: Text(
                      "Oneloc ekibi vermiş olduğun bilgileri inceliyor. Onaylandıktan sonra bir bildirim alacaksın ve hesabını kullanmaya başlatabileceksin.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen()));
                    },
                    color: Theme.of(context).colorScheme.onTertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Çıkış yap",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: InkWell(
                          child: Text(
                            "Vazgeçtim, bilgilerimi tamamen sil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeletedAccount()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
