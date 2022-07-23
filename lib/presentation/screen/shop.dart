import 'package:flutter/material.dart';
import 'package:stationary_import/presentation/widget/empty_products.dart';
import 'package:stationary_import/presentation/widget/products_list.dart';
import '../../model/product.dart';

class Shop extends StatelessWidget {
  Shop({Key? key}) : super(key: key);
  List<String> ps = Product.productsfinding(PRODUCTS).toList();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 50,
          child: AppBar(
            title: Text("Categories"),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 50),
          child: ps.length == 0 ? const EmptyProduct() : ProductList()),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/store-form");
              },
              child: Icon(Icons.add)),
        ),
      )
    ]);
  }
}
