import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StoreForm extends StatelessWidget {
  const StoreForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adding items to the store")),
      body: Container(
        padding: EdgeInsets.all(10),
         child: Form(child: Column(children: [
            Expanded(child: Container()),
            TextFormField( decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Product name"),),
            const SizedBox(height:10),
            TextFormField( decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Product description"),),
            const SizedBox(height:10),
            TextFormField( decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Indivdual price"),),
            const SizedBox(height:10),
            TextFormField( decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Total quantiy"),),
            const SizedBox(height:10),
            TextFormField( decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Quantity of individual"),),
            const SizedBox(height:10),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [ElevatedButton(onPressed: null, child: Text("submit"))],)
         ],)),
      ),
    );
  }
}