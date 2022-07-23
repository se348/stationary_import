import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/product.dart';
import '../../model/user.dart';
import '../item_tile.dart';
import 'individual_pending_order.dart';
import 'order_form.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Expanded(
              child: ListView(
            children: [
              for (int i = 0; i < 10; i++)
                IndividualPendingOrder(
                  product: Product(
                      name: "bic",
                      description: "this is sharp pen",
                      packageAmount: 400,
                      individualQuantity: 10,
                      measurement: "piece",
                      price: 70.0,
                      category: "pen2"),
                  user: User(
                      name: "semir ahmed",
                      email: "semir2578@gmail.com",
                      phoneNumber: "0984836744"),
                  quantity: 20,
                ),
              const Divider(),
            ],
          )),
        ]),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 50,
            width: double.infinity,
            child: AppBar(
              title: const Text("Orders"),
            )),
      )
    ]);
  }
}
