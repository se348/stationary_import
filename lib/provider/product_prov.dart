import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';
import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  List<String> categories = [];
  List<Product> prodWithCat = [];
  int status = -1;
  int mine_status = -1;
  String _url = URL.product;
  getProductWithCat(category) {
    prodWithCat = Product.productsWithCategory(category, products).toList();
    notifyListeners();
  }

  Future<int> getProducts() async {
    status = 0;
    notifyListeners();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    try {
      await Future.delayed(Duration(seconds: 4));
      http.Response res = await http.get(Uri.parse(_url), headers: {
        'auth-token': URL.token,
      });
      status = res.statusCode;
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        products = Product.fromJson(body);
        categories = Product.productsfinding(products).toList();
      }
    } catch (err) {
      status = -2;
    }
    notifyListeners();
    return status;
  }

  Future<int> addProduct(Product product) async {
    mine_status = 0;
    notifyListeners();
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    final body = {
      "name": product.name,
      "description": product.description,
      "packageAmount": product.packageAmount,
      "individualQuantity": product.individualQuantity,
      "measurement": product.measurement,
      "price": product.price,
      "category": product.category
    };
    try {
      http.Response res = await http.post(Uri.parse(_url),
          headers: {
            "auth-token": URL.token,
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body));
      mine_status = res.statusCode;
      notifyListeners();
    } catch (err) {
      mine_status == -2;
    }
    return mine_status;
  }
}
