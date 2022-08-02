import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';
import '../model/user.dart';
import '../services/token_rel.dart';

class LoginProv with ChangeNotifier {
  String? token;
  final String _url = URL.login;
  int status = -1;
  bool hasToken = false;
  int another_status = -1;
  Future<bool> checkToken() async {
    another_status = 0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));
    hasToken = await Token.containsKeyInSecureData();
    another_status = -1;
    notifyListeners();
    return hasToken;
  }

  Future<void> deleteToken() async {
    await Token.deleteToken();
    hasToken = false;
    notifyListeners();
  }

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
      if (res.statusCode == 200) {
        await Token.writeToken('${res.body}');
      }
    } catch (err) {
      status = -2;
    }
    notifyListeners();
  }
}
