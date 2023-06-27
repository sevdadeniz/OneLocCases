import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DeleteAccountService {
  String host = "https://case.onelocapp.com/api/User/delete-my-account?";
  Future<String> delete(
    String? email,
  ) async {
    try {
      Response r = await http.post(Uri.parse("${host}email=${email!}"));

      if (r.statusCode == 200) {
        return json.decode(r.body)["message"];
      } else
        return "error";
    } catch (e) {
      print(e.toString());
    }
    return "Error";
  }
}
