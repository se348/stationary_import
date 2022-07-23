import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/presentation/widget/order_form.dart';
import '../../model/product.dart';

class SubCategory extends StatelessWidget {
  SubCategory({Key? key}) : super(key: key);
  late int i;
  late List<Product> products;

  String pricefinder(double price){
    if(price<1000){
      return price.toString();
    }
    else if(price<1000000){
      return "${price/1000}K";
    }
    else{
      return "${price/1000000}M";
    }
  }

  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)!.settings.arguments as String;
    products = Product.productsWithCategory(arg, PRODUCTS).toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Sub-category")),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                    enableDrag: false,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return OrderForm(product: products[index],);
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
                            Text(products[index].name, style: Theme.of(context).textTheme.titleLarge,),
                            Row(children: [
                              Expanded(child: Text(products[index].description, softWrap: true,)),
                              Container(
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Theme.of(context).colorScheme.primary)),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.price_change, color: Theme.of(context).colorScheme.primary,),
                                    Text("${pricefinder(products[index].price)} Birr"),
                                  ],
                                ),

                              ),
                            ],),
                            Text("Each pakage conatains ${products[index].individualQuantity} ${products[index].measurement}")
                          ],

                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(width: 2,color: Theme.of(context).colorScheme.secondary)),
                          padding: EdgeInsets.all(10),
                          child: Text("${products[index].packageAmount} packages available"),
                        ),
                      ],
                    ),
                  )),
            );
          },
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/store-form", arguments: products[0].category);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
