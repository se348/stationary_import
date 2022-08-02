import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/model/order.dart';

import '../services/token_rel.dart';
import 'url.dart';

class OrderProv with ChangeNotifier {
  final String _url = URL.order;
  List<Order> orders = [];
  int mine_status = -1;
  int status = -1;
  int new_status = -1;
  Future<int> placeOrder(String prodId, int quantity) async {
    mine_status = 0;
    notifyListeners();
    final body = {"product": prodId, "quantity": quantity};
    try {
      http.Response res = await http.post(Uri.parse(_url),
          headers: {
            "auth-token": await Token.getToken() ?? "",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      mine_status = res.statusCode;
    } catch (err) {
      mine_status = -2;
    }
    notifyListeners();
    return mine_status;
  }

  Future<int> getUnconfirmedOrders() async {
    status = 0;
    notifyListeners();
    try {
      http.Response res =
          await http.get(Uri.parse('$_url/unconfirmed'), headers: {
        'auth-token': await Token.getToken() ?? "",
      });
      status = res.statusCode;
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        orders = Order.fromJson(body);
      }
    } catch (err) {
      status = -2;
    }
    notifyListeners();
    return status;
  }

  Future<int> confirmOrder(String orderId, int acceptance) async {
    new_status = 0;
    notifyListeners();
    final body = {"status": acceptance};
    try {
      http.Response res = await http.put(Uri.parse('$_url/$orderId'),
          headers: {
            "auth-token": await Token.getToken() ?? "",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      new_status = res.statusCode;
      if (new_status == 200) {
        await getUnconfirmedOrders();
      }
    } catch (err) {
      new_status = -2;
    }
    notifyListeners();
    return new_status;
  }
}
