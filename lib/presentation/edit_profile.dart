import 'dart:ui';

import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("Edit profile")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
                children: [
                  Column(children: [
                    Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Image.asset("assets/cover.png", height: 150,)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.person),hintText: "Name", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.email_sharp),hintText: "Email", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.phone),hintText: "Phone", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const TextButton(onPressed: null, child: Text("change password")),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){}, child: Text("save chnages"),
                    )  )    
                  ],),
                ],
              ),
          ),
        ],
      ),
    );
  }
}

