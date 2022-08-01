import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/product.dart';
import 'package:stationary_import/presentation/widget/individual_prod.dart';
import 'package:stationary_import/provider/product_prov.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      Provider.of<ProductProvider>(context, listen: false).getProducts();
    }
    setState(() {
      isInit = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    return Consumer<ProductProvider>(
      builder: (context, value, child) => RefreshIndicator(
        onRefresh: () {
          return Provider.of<ProductProvider>(context, listen: false)
              .getProducts();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: value.categories.length,
                itemBuilder: (context, index) {
                  return ProdInvdiv(
                      product: value.categories[index], index: index);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 5 / 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
