import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/empty_products.dart';
import 'package:stationary_import/presentation/widget/products_list.dart';
import 'package:stationary_import/provider/product_prov.dart';
import '../../model/product.dart';

class Shop extends StatefulWidget {
  Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool isInit = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();

    return Consumer<ProductProvider>(
        builder: ((context, value, child) => Container(
            padding:
                const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 10),
            child: value.categories.length == 0
                ? const EmptyProduct()
                : ProductList())));
  }
}
