import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/product.dart';
import 'package:stationary_import/provider/product_prov.dart';

class StoreForm extends StatelessWidget {
  StoreForm({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController packageAmount = TextEditingController();

  TextEditingController individualQuantity = TextEditingController();

  TextEditingController measurement = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController category = TextEditingController();
  int status = -1;
  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context)?.settings.arguments;
    category.text = text != null ? text as String : "";
    return Scaffold(
      appBar: AppBar(title: Text("Adding items to the store")),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
            child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                TextFormField(
                  controller: name,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null) {
                      return "Please enter product name";
                    }
                    if (val.length <= 3 || val.length >= 50) {
                      return "Product name must be between 3 and 50 charachters";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Product name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 8,
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null) {
                      return "Please enter description about the product";
                    } else if (val.length > 255 || val.length < 5) {
                      return "Products desription must be between 5 and 255 charachters";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Product description"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null) {
                      return "Please provide price";
                    }
                    return double.tryParse(val) == null
                        ? "The price of a product needs to be a number"
                        : null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Indivdual price"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: packageAmount,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null) {
                      return "Please provide the total available packages";
                    }
                    return double.tryParse(val) == null
                        ? "The packages of a product needs to be a number"
                        : null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Total quantity"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: individualQuantity,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null) {
                      return "Please provide the amount of each piece a package contains";
                    }
                    return double.tryParse(val) == null
                        ? "The unit of product a package contains needs to be a number"
                        : null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Quantity of individual"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: measurement,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null) {
                      return "Please provide measurement type of each unit of product";
                    }
                    if (val.length >= 30) {
                      return "Improper length";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Measurement type"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: category,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val == null) {
                      return "Please provide category of the product";
                    }
                    if (val.length >= 30) {
                      return "Improper length";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Category"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () async {
                          status = await Provider.of<ProductProvider>(context,
                                  listen: false)
                              .addProduct(Product(
                                  name: name.text,
                                  description: description.text,
                                  packageAmount:
                                      int.tryParse(packageAmount.text)!,
                                  individualQuantity:
                                      int.tryParse(individualQuantity.text)!,
                                  measurement: measurement.text,
                                  price: int.tryParse(price.text)!,
                                  category: category.text));
                          if (status == 200) {
                            Navigator.of(context).pop();
                            if (text == null) {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .getProducts();
                            } else {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .getProductWithCat(text as String);
                            }
                          }
                        },
                        child: status == 0
                            ? const CircularProgressIndicator()
                            : const Text(
                                "Submit",
                                style: TextStyle(color: Colors.black87),
                              ))
                  ],
                )
              ]),
            )
          ],
        )),
      ),
    );
  }
}
