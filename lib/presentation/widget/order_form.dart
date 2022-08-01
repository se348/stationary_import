import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/order_prov.dart';

import '../../model/product.dart';

class OrderForm extends StatefulWidget {
  OrderForm({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  double quantity = 0;
  int status = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "${widget.product.name}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Individual package price- birr"),
              Text("${widget.product.price}"),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Packages available:-",
                softWrap: true,
              ),
              Text("${widget.product.packageAmount}")
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Individual item of"),
              Text(
                  "${widget.product.individualQuantity} ${widget.product.measurement}"),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Slider(
              min: 0,
              max: widget.product.packageAmount.toDouble(),
              value: quantity,
              label: "${quantity} pieces",
              divisions: widget.product.packageAmount.toInt(),
              onChanged: (val) {
                setState(() {
                  quantity = val.roundToDouble();
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (() async {
                    return showDialog(
                        //barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Are you sure?"),
                            content: SingleChildScrollView(
                              child: ListBody(children: [
                                Text("Item name:- ${widget.product.name}"),
                                Text("Item quatity:- ${quantity}"),
                                Text(
                                    "Item price total:- ${widget.product.price * quantity}")
                              ]),
                            ),
                            actions: status == 0
                                ? [CircularProgressIndicator()]
                                : [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("No")),
                                    TextButton(
                                        onPressed: () async {
                                          status = await Provider.of<OrderProv>(
                                                  context,
                                                  listen: false)
                                              .placeOrder(widget.product.id!,
                                                  quantity.toInt());
                                          if (status == 200) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Your order is placed wait for confirmation")));
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          }
                                          if (status == 400) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Some error occurred")));
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text("Yes")),
                                  ],
                          );
                        });
                  }),
                  child: Text("submit")),
            ],
          )
        ]),
      ),
    );
  }
}
