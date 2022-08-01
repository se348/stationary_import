import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/model/log.dart';

import 'url.dart';

class LogsProv with ChangeNotifier {
  List<Log> logs = [];
  final String _url = URL.logs;
  Future<int> getLogs() async {
    int status = 0;
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res = await http.get(Uri.parse('$_url/'), headers: {
      'auth-token': URL.token,
    });
    status = res.statusCode;
    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);
      logs = Log.fromJson(body);
    }
    notifyListeners();
    return status;
  }
}
