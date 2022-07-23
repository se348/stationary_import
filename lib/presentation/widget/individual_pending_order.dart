

import 'package:flutter/material.dart';
import 'package:stationary_import/model/product.dart';

import '../../model/user.dart';

class IndividualPendingOrder extends StatelessWidget {
  IndividualPendingOrder({Key? key, required this.product, required this.user, required this.quantity }) : super(key: key);
  Product product;
  User user;
  int quantity;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(children: [
          Container(padding: EdgeInsets.all(8.0),width:double.infinity , color: Theme.of(context).colorScheme.primary,child:Text("${user.name} has ordered $quantity pieces of ${product.name}. Confirm?")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.close, color: Colors.red,)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.check, color: Colors.black,)),
            ],
          ),
        ],)
      
      ),
    );
  }
}