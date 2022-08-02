import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/custom_indicator.dart';
import 'package:stationary_import/presentation/widget/empty_products.dart';
import 'package:stationary_import/presentation/widget/gotoHomeScreen.dart';
import 'package:stationary_import/presentation/widget/no_internet.dart';
import 'package:stationary_import/presentation/widget/products_list.dart';
import 'package:stationary_import/provider/product_prov.dart';
import '../../model/product.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();

    return Consumer<ProductProvider>(
        builder: ((context, value, child) => value.status == 0
            ? const Center(
                child: CustomIndicator(),
              )
            : value.status == -2
                ? NoInternet()
                : value.status == 401
                    ? GoToHomeScreen()
                    : Container(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 5, right: 5, top: 10),
                        child: value.categories.length == 0
                            ? const EmptyProduct()
                            : ProductList())));
  }
}
