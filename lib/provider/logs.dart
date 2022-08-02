import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/model/log.dart';

import '../services/token_rel.dart';
import 'url.dart';

class LogsProv with ChangeNotifier {
  List<Log> logs = [];
  int status = -1;
  final String _url = URL.logs;
  Future<int> getLogs() async {
    status = 0;
    notifyListeners();
    try {
      http.Response res = await http.get(Uri.parse('$_url/'), headers: {
        'auth-token': await Token.getToken() ?? "",
      });
      status = res.statusCode;
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        logs = Log.fromJson(body);
      }
    } catch (err) {
      status = -2;
    }

    notifyListeners();
    return status;
  }
}
