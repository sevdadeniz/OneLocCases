import 'package:flutter/material.dart';
import 'package:oneloc_case/screens/register.dart';
import 'package:oneloc_case/screens/state_page.dart';
import 'package:oneloc_case/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String? email, pass;

class _LoginScreenState extends State<LoginScreen> {
  LoginService loginService = LoginService();

  login() async {
    var response = await loginService.login(email, pass);
    if (response == "Login_Successful") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  // here element passing to the detail page element contain index other details
                  const StatePage()));
    } else if (response == "Email_Or_Password_IsIncorrect") {
      const snackBar = SnackBar(
        content: Text('Şifre Veya Email Hatalı'),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        content: Text('Hatalı İşlem'),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fillColor =
        Theme.of(context).colorScheme.secondary; //textfield background color
    final colorP = Theme.of(context).colorScheme.primary; //button color
    final colorH = Theme.of(context).colorScheme.onSecondary; //hinttext color

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Giriş Yap",
              textAlign: TextAlign.center,
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'En iyi deneyimlerin merkezi Oneloc’a ',
                          style: TextStyle(fontSize: 26),
                        ),
                        TextSpan(
                          text: 'hoş geldin!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    makeInput(
                        color: fillColor,
                        colorP: colorP,
                        hintTxt: "E-posta adresi",
                        colorH: colorH,
                        type: true),
                    makeInput(
                        color: fillColor,
                        colorP: colorP,
                        hintTxt: "Şifre",
                        colorH: colorH,
                        obsureText: true,
                        type: false),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Şifremi unuttum",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        login();
                      },
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Giriş yap",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: const Text(
                        "Yeni hesap oluştur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                    ),
                  ],
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Oneloc’un mobil uygulamasına giriş yapan kullanıcılar ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'Gizlilik Politikası',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: '’na ve ',
                            style: TextStyle(fontSize: 12),
                          ),
                          TextSpan(
                            text: 'Şartlar ve Koşullar',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: '’a tabidir.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget makeInput(
    {color, colorP, hintTxt, colorH, obsureText = false, required bool type}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 60.0,
        child: TextField(
          obscureText: obsureText,
          decoration: InputDecoration(
            hintText: '$hintTxt',
            hintStyle: TextStyle(
                color: colorH, fontSize: 15, fontWeight: FontWeight.bold),
            filled: true,
            fillColor: color,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: color,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: colorP)),
          ),
          onChanged: (value) {
            type ? email = value : pass = value;
          },
        ),
      ),
    ],
  );
}
