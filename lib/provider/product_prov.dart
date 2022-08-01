import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stationary_import/provider/url.dart';
import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  List<String> categories = [];
  List<Product> prodWithCat = [];
  String _url = URL.product;
  getProductWithCat(category) async {
    await getProducts();
    prodWithCat = Product.productsWithCategory(category, products).toList();
  }

  Future<int> getProducts() async {
    int status = 0;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmU1MjJmZWNjOWU1ODI3ZWFiNjllNGYiLCJpYXQiOjE2NTkyMDkxNTB9.Hr9rdQOBsZq8KrLeIMxQnTrKTHqD07z5OICthGMwgBo";
    http.Response res = await http.get(Uri.parse(_url), headers: {
      'auth-token': URL.token,
    });
    status = res.statusCode;
    if (res.statusCode == 200) {
      List body = jsonDecode(res.body);
      products = Product.fromJson(body);
      categories = Product.productsfinding(products).toList();
    }
    notifyListeners();
    return status;
  }

  Future<int> addProduct(Product product) async {
    int mine_status = 0;
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
}
