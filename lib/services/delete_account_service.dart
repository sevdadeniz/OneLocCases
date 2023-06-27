// ignore: file_names
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
        // ignore: curly_braces_in_flow_control_structures
        return "error";
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return "Error";
  }
}
