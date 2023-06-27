
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RegisterService {
  String host = "https://case.onelocapp.com/api/User/register";
  Future<String> register(String? userName, email, phone, password) async {
    try {
      Response r = await http.post(Uri.parse(host),
          body: json.encode({
            "userName": userName,
            "email": email,
            "phone": phone,
            "password": password
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });

      if (r.statusCode == 200) {
        return json.decode(r.body)["message"];
      } else
        // ignore: curly_braces_in_flow_control_structures
        return "error";
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return "Error";
  }
}
