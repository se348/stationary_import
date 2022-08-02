import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/product.dart';
import 'package:stationary_import/provider/order_prov.dart';

import '../../model/user.dart';

class IndividualPendingOrder extends StatelessWidget {
  IndividualPendingOrder(
      {Key? key,
      this.id,
      required this.product,
      required this.user,
      required this.quantity})
      : super(key: key);
  String product;
  String user;
  int quantity;
  String? id;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
          child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                  "${user} has ordered $quantity pieces of ${product}. Confirm?")),
          Consumer<OrderProv>(
            builder: (context, value, child) => value.new_status == 0
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await Provider.of<OrderProv>(context, listen: false)
                                .confirmOrder(id!, -1);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () async {
                            await Provider.of<OrderProv>(context, listen: false)
                                .confirmOrder(id!, 1);
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.black,
                          )),
                    ],
                  ),
          ),
        ],
      )),
    );
  }
}
