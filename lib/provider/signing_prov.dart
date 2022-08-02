import 'package:stationary_import/provider/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SigningUp with ChangeNotifier {
  String _url = URL.unconfirmedUser;
  int status = -1;

  Future<int> addUser(User user) async {
    status = 0;
    notifyListeners();
    final body = jsonEncode(<String, String>{
      "name": user.name!,
      "email": user.email,
      "phoneNumber": user.phoneNumber!,
      "password": user.password!
    });
    try {
      http.Response res = await http.post(Uri.parse(_url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      status = res.statusCode;
    } catch (err) {
      status = -2;
    }
    notifyListeners();
    return status;
  }
}
