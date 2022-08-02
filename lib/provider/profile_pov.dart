import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stationary_import/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';

class ProfileProv with ChangeNotifier {
  User? me;
  String _url = URL.me;
  int new_status = -1;
  int status = -1;
  int another_status = -1;
  Future<int> getMyInfo() async {
    new_status = 0;
    notifyListeners();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    try {
      await Future.delayed(Duration(seconds: 5));
      http.Response res =
          await http.get(Uri.parse(_url), headers: {'auth-token': URL.token});
      new_status = res.statusCode;
      if (new_status == 200) {
        Map map_c = jsonDecode(res.body);
        me = User(
            name: map_c['name'],
            email: map_c['email'],
            phoneNumber: map_c['phoneNumber'],
            id: map_c['_id'],
            role: map_c['role']);
      }
    } catch (err) {
      new_status = -2;
    }
    notifyListeners();
    return new_status;
  }

  Future<int> changeMyinfo(String name, String phone, String email) async {
    status = 0;
    notifyListeners();
    Map body = {"name": name, "email": email, 'phoneNumber': phone};
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    try {
      http.Response res = await http.put(Uri.parse(_url),
          headers: {
            'auth-token': URL.token,
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      status = res.statusCode;
    } catch (err) {
      status = -2;
    }
    notifyListeners();
    return status;
  }

  Future<int> changeMyPassword(
      String id, String oldPassword, String password) async {
    another_status = 0;
    notifyListeners();
    String new_url = '${URL.password}/${id}';
    int status = 0;
    Map body = {'old_password': oldPassword, 'new_password': password};
    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
      http.Response res = await http.put(Uri.parse(new_url),
          headers: {
            'auth-token': URL.token,
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      another_status = res.statusCode;
    } catch (err) {
      another_status = -2;
    }
    notifyListeners();
    return another_status;
  }
}
