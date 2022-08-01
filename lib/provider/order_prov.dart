import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/model/order.dart';

import 'url.dart';

class OrderProv with ChangeNotifier {
  final String _url = URL.order;
  List<Order> orders = [];
  Future<int> placeOrder(String prodId, int quantity) async {
    int mine_status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    final body = {"product": prodId, "quantity": quantity};
    http.Response res = await http.post(Uri.parse(_url),
        headers: {
          "auth-token": URL.token,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    mine_status = res.statusCode;
    notifyListeners();
    return mine_status;
  }

  Future<int> getUnconfirmedOrders() async {
    int status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res =
        await http.get(Uri.parse('$_url/unconfirmed'), headers: {
      'auth-token': URL.token,
    });
    status = res.statusCode;
    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);
      orders = Order.fromJson(body);
    }
    notifyListeners();
    return status;
  }

  Future<int> confirmOrder(String orderId, int acceptance) async {
    int mine_status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    final body = {"status": acceptance};
    http.Response res = await http.put(Uri.parse('$_url/$orderId'),
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
