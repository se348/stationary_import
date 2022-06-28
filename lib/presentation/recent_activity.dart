import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentActivity extends StatelessWidget {
  RecentActivity({Key? key}) : super(key: key);
  int i= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recent activities")),
      body: Container(
        child: Column(children: [
          Expanded(child: ListView(children: [
            for(i =0; i<10; i++)
              Card(child: Container(padding:EdgeInsets.all(10),child: Text("Semir added 5 items to the store")),),
            for(i =0; i<10; i++)
              Card(child: Container(padding:EdgeInsets.all(10),child: Text("Semir ordered 5 items of printers")),)
          ],))
        ]),
      ),
    );
  }
}