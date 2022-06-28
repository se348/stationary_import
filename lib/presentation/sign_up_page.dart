import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text("Sign up page")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Image.asset("assets/cover.png", height: 150,)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.person),hintText: "Name", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.email_sharp),hintText: "Email", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.phone),hintText: "Phone", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(obscureText: true,decoration: InputDecoration(prefixIcon:Icon(Icons.password_sharp),hintText: "Password", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0)))),),
                    const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 12),child: TextField(obscureText: true,decoration: InputDecoration(prefixIcon:Icon(Icons.password_sharp),hintText: "Confirm-password", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0)))),),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Theme(
                          data: ThemeData(canvasColor: Colors.transparent),
                          child: InputChip(label: Text("Male"), backgroundColor: Colors.transparent,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Theme(
                          data: ThemeData(canvasColor: Colors.transparent),
                          child: InputChip(label: Text("Female"), backgroundColor: Colors.transparent,)),
                      ),
                    ],),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed: (){}, child: Text("Sign-up"),
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

