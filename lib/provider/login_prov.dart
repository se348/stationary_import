import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';
import '../model/user.dart';

class LoginProv with ChangeNotifier {
  String? token;
  final String _url = URL.login;
  int status = -1;
  Future<void> loginUser(User user) async {
    status = 0;
    notifyListeners();
    final body = jsonEncode(
        <String, String>{"email": user.email, "password": user.password!});
    try {
      http.Response res = await http.post(Uri.parse(_url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      status = res.statusCode;
      URL.token = '${res.body}';
    } catch (err) {
      status = -2;
    }
    notifyListeners();
  }
}
