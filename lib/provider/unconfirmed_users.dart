import 'package:flutter/material.dart';
import 'package:stationary_import/model/user.dart';
import 'package:http/http.dart' as http;
import '../services/token_rel.dart';
import 'url.dart';
import 'dart:convert';

class UnconfirmedUsers with ChangeNotifier {
  List<User> users = [];
  String _url = URL.unconfirmedUser;
  int status = -1;
  int mine_status = -1;
  Future<int> getUnconfirmedUsers() async {
    status = 0;
    notifyListeners();
    try {
      http.Response res = await http.get(Uri.parse(_url));
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        users = User.fromJson(body);
      }
      status = res.statusCode;
    } catch (err) {
      status = -2;
    }

    notifyListeners();
    return status;
  }

  Future<int> confirmUser(String id, String role, int status) async {
    mine_status = 0;
    notifyListeners();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    String myUrl = URL.user;
    final body = {"id": id, "role": role, "status": status};
    try {
      http.Response res = await http.post(Uri.parse(myUrl),
          headers: {
            "auth-token": await Token.getToken() ?? "",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      mine_status = res.statusCode;
      if (mine_status == 200) {
        await getUnconfirmedUsers();
      }
    } catch (err) {
      mine_status = -2;
    }

    notifyListeners();
    return mine_status;
  }
}
