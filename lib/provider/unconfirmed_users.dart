import 'package:flutter/material.dart';
import 'package:stationary_import/model/user.dart';
import 'package:http/http.dart' as http;
import 'url.dart';
import 'dart:convert';

class UnconfirmedUsers with ChangeNotifier {
  List<User> users = [];
  String _url = URL.unconfirmedUser;
  Future<int> getUnconfirmedUsers() async {
    int status = 0;
    http.Response res = await http.get(Uri.parse(_url));
    status = res.statusCode;
    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);
      users = User.fromJson(body);
    }
    notifyListeners();
    return status;
  }

  Future<int> confirmUser(String id, String role, int status) async {
    int mine_status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    String myUrl = URL.user;
    final body = {"id": id, "role": role, "status": status};
    http.Response res = await http.post(Uri.parse(myUrl),
        headers: {
          "auth-token": URL.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    mine_status = res.statusCode;
    notifyListeners();
    return mine_status;
  }
}
