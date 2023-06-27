import 'package:flutter/material.dart';
import 'package:oneloc_case/screens/login.dart';

import '../services/delete_account_service.dart';

class DeletedAccount extends StatefulWidget {
  const DeletedAccount({super.key});

  @override
  State<DeletedAccount> createState() => _DeletedAccountState();
}

String? emailD;

class _DeletedAccountState extends State<DeletedAccount> {
  final myController = TextEditingController();
  DeleteAccountService deleteService = DeleteAccountService();

  delete(String email) async {
    var response = await deleteService.delete(email);
    if (response == "Account_Deleted") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  // here element passing to the detail page element contain index other details
                  const LoginScreen()));
    } else if (response == "User_Not_Found") {
      const snackBar = SnackBar(
        content: Text('Silinecek Hesap Bulunamadı'),
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

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            'images/oneloc_icon_appBar.png',
            fit: BoxFit.contain,
            height: 50,
          ),
          centerTitle: true,
        ),
        body: Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Aramızdan ayrılacağın için üzgünüz",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "E-posta adresinizi giriniz",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'E-posta',
                    hintStyle: TextStyle(
                        color: colorH,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: fillColor,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: fillColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: colorP)),
                  ),
                  onChanged: (myController) {
                    emailD = myController;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    delete(emailD!);
                  },
                  color: Theme.of(context).colorScheme.onTertiary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Hesabı Sil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
