import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfirmRegistration extends StatelessWidget {
  ConfirmRegistration({Key? key}) : super(key: key);
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unconfirmed users")),
      body: Container(
        child:Column(
          children: [
            Expanded(child:ListView(children: [
              for (i=0; i<10; i++)
                Card(child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Semir Ahmed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Semir2578@gmail.com"),
                          SizedBox(height: 8,),
                          Text("0984836744"),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              ChoiceChip(label: Text("Manager"), selected: false),
                              SizedBox(width: 8,),
                              ChoiceChip(label: Text("User"), selected: true)
                            ],
                          )
                        ],),
                        CircleAvatar(radius: 80,backgroundImage: AssetImage("assets/anonymous.png")),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        TextButton(onPressed: null, child: Text("No")),
                        SizedBox(width: 8,),
                        TextButton(onPressed: null, child: Text("Yes")),
                        SizedBox(width: 8,),
                      ],)
                  ]),
                ),)
            ]) ,),
          ],
        )
      ),
    );
  }
}