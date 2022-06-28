import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderForm extends StatelessWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text("Printer", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        const Text("Lorem ipsum sdjfsjkkkfkfjskfk Lorem ipsum sdjfsjkkkfkfjskfk Lorem ipsum sdjfsjkkkfkfjskfk Lorem ipsum sdjfsjkkkfkfjskfk", softWrap: true, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),),
        const Text("Individual price- 20 birr"),
        const Divider(),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex:1, child: Container(child: const Text("Item available:- 350 packages of 50 Item available:- 350 packages of 50 Item available:- 350 packages of 50", softWrap: true,))),
            const Expanded(flex:1, child: Slider(value: 0, onChanged: null))
        ],),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (() async{
              return showDialog(
                context: context, 
                builder: (BuildContext context){
                  return AlertDialog(
                    title: const Text("Are you sure?"),
                    content:SingleChildScrollView(
                      child: ListBody(children: const [
                        Text("Item name:- printer"),
                        Text("Item quatity:- 40"),
                        Text("Item price total:- 100 birr")
                      ]),
                    ),
                    actions: const [
                      TextButton(onPressed: null, child: Text("No")),
                      TextButton(onPressed: null, child: Text("Yes")),
                    ],
                  );
                });
            }), child: Text("submit")),
          ],
        )
      ]),
    );
  }
}