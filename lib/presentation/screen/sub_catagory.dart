import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/order_form.dart';
import '../../model/product.dart';
import '../../provider/product_prov.dart';

class SubCategory extends StatefulWidget {
  SubCategory({Key? key}) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  late int i;
  bool isInit = false;

  String pricefinder(double price) {
    if (price < 1000) {
      return price.toString();
    } else if (price < 1000000) {
      return "${price / 1000}K";
    } else {
      return "${price / 1000000}M";
    }
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      String arg = ModalRoute.of(context)!.settings.arguments as String;
      Provider.of<ProductProvider>(context, listen: false)
          .getProductWithCat(arg);
    }
    setState(() {
      isInit = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String arg2 = ModalRoute.of(context)!.settings.arguments as String;
    return Consumer<ProductProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: const Text("Sub-category")),
        body: RefreshIndicator(
          onRefresh: (() {
            return Provider.of<ProductProvider>(context, listen: false)
                .getProductWithCat(arg2);
          }),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
              itemCount: value.prodWithCat.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        enableDrag: false,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return OrderForm(
                            product: value.prodWithCat[index],
                          );
                        });
                  },
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              child: Image.asset(
                                "assets/cover.png",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.prodWithCat[index].name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      value.prodWithCat[index].description,
                                      softWrap: true,
                                    )),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary)),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.price_change,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          Text(
                                              "${pricefinder(value.prodWithCat[index].price.toDouble())} Birr"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                    "Each pakage conatains ${value.prodWithCat[index].individualQuantity} ${value.prodWithCat[index].measurement}")
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  "${value.prodWithCat[index].packageAmount} packages available"),
                            ),
                          ],
                        ),
                      )),
                );
              },
            )),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/store-form", arguments: arg2);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
