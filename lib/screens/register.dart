import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oneloc_case/screens/login.dart';
import 'package:oneloc_case/screens/state_page.dart';
import 'package:oneloc_case/services/registerService.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

String? userName, emailR, phone, password;

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode focusNode = FocusNode();
  RegisterService registerService = RegisterService();

  register() async {
    String response =
        await registerService.register(userName, emailR, phone, password);
    if (response == "User_Registration_Successful") {
      const snackBar = SnackBar(
        content: Text('Hesap Oluşturuldu'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const StatePage()));
    } else if (response == "This_Email_Is_Used") {
      const snackBar = SnackBar(
        content: Text('Bu email kullanılmaktadır'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (response == "This_Phone_Number_Is_Used") {
      const snackBar = SnackBar(
        content: Text('Bu telefon numarası kullanılmaktadır'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (response == "This_Email_Is_Used") {
      const snackBar = SnackBar(
        content: Text('Bu email kullanılmaktadır'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (response == "This_Usernam_Is_Used") {
      const snackBar = SnackBar(
        content: Text('Bu usernamekullanılmaktadır'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        content: Text('Hatalı İşlem'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fillColor =
        Theme.of(context).colorScheme.secondary; //textfield background color
    final colorP = Theme.of(context).colorScheme.primary; //button color
    final colorH = Theme.of(context).colorScheme.onSecondary; //hinttext color

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Yeni Hesap Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0),
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hemen yeni bir hesap oluştur ve en iyi ',
                        style: TextStyle(fontSize: 26),
                      ),
                      TextSpan(
                        text: 'deneyimi yaşa!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              Column(
                children: [
                  makeInput(
                      color: fillColor,
                      colorP: colorP,
                      hintTxt: "Kullanıcı adı",
                      colorH: colorH,
                      type: "userName"),
                  makeInput(
                      color: fillColor,
                      colorP: colorP,
                      hintTxt: "E-posta adresi",
                      colorH: colorH,
                      type: "emailR"),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      hintText: 'Telefon Numarası',
                      hintStyle: TextStyle(
                          color: colorH,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      counterText: "",
                      filled: true,
                      fillColor: fillColor,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: fillColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: colorP)),
                    ),
                    onChanged: (value) {
                      phone = value.number.toString();
                    },
                    initialCountryCode:
                        'TR', //default contry code, NP for Nepal
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  makeInput(
                      color: fillColor,
                      colorP: colorP,
                      hintTxt: "Şifre",
                      colorH: colorH,
                      obsureText: true,
                      type: "password"),
                ],
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  register();
                },
                color: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Hesabı Oluştur",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: const Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput(
    {color,
    colorP,
    hintTxt,
    colorH,
    obsureText = false,
    required String type}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
            type == "userName"
                ? userName = value
                : type == "emailR"
                    ? emailR = value
                    : password = value;
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
