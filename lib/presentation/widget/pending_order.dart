import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/order_prov.dart';

import '../../model/product.dart';
import '../../model/user.dart';
import '../item_tile.dart';
import 'individual_pending_order.dart';
import 'order_form.dart';

class PendingOrder extends StatefulWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  State<PendingOrder> createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      Provider.of<OrderProv>(context, listen: false).getUnconfirmedOrders();
    }
    setState(() {
      isInit = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProv>(context, listen: false).getUnconfirmedOrders();
    return Consumer<OrderProv>(
      builder: (context, value, child) => Container(
        child: Column(children: [
          Expanded(
              child: ListView.separated(
            itemCount: value.orders.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) => IndividualPendingOrder(
                product: value.orders[index].product,
                user: value.orders[index].user,
                quantity: value.orders[index].quantity,
                id: value.orders[index].id),
          )),
        ]),
      ),
    );
  }
}
