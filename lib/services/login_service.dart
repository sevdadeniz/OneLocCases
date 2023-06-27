import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginService {
  String host = "https://case.onelocapp.com/api/User/login?";
  Future<String> login(String? email, String? password) async {
    try {
      Response r = await http
          .post(Uri.parse("${host}email=${email!}&password=${password!}"));

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
