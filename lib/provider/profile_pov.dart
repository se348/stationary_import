import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stationary_import/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';

class ProfileProv with ChangeNotifier {
  User? me;
  String _url = URL.me;
  Future<int> getMyInfo() async {
    int status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res =
        await http.get(Uri.parse(_url), headers: {'auth-token': URL.token});
    status = res.statusCode;
    if (status == 200) {
      Map map_c = jsonDecode(res.body);
      me = User(
          name: map_c['name'],
          email: map_c['email'],
          phoneNumber: map_c['phoneNumber'],
          id: map_c['_id'],
          role: map_c['role']);
    }
    notifyListeners();
    return status;
  }

  Future<int> changeMyinfo(String name, String phone, String email) async {
    int status = 0;
    Map body = {"name": name, "email": email, 'phoneNumber': phone};
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res = await http.put(Uri.parse(_url),
        headers: {
          'auth-token': URL.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    status = res.statusCode;
    notifyListeners();
    return status;
  }

  Future<int> changeMyPassword(
      String id, String oldPassword, String password) async {
    String new_url = '${URL.password}/${id}';
    print(new_url);
    int status = 0;
    Map body = {'old_password': oldPassword, 'new_password': password};
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res = await http.put(Uri.parse(new_url),
        headers: {
          'auth-token': URL.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    status = res.statusCode;
    print(res.statusCode);
    notifyListeners();
    return status;
  }
}
