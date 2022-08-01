import 'package:stationary_import/provider/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SigningUp with ChangeNotifier {
  String _url = URL.unconfirmedUser;

  Future<int> addUser(User user) async {
    int status = 0;
    final body = jsonEncode(<String, String>{
      "name": user.name!,
      "email": user.email,
      "phoneNumber": user.phoneNumber!,
      "password": user.password!
    });
    http.Response res = await http.post(Uri.parse(_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    status = res.statusCode;
    notifyListeners();
    return status;
  }
}
