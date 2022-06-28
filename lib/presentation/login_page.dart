import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.blueGrey])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(child: Image.asset("assets/default.png", width: 300, height: 300,)),
            Column(children: [
              const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 5),child: TextField(decoration: InputDecoration(prefixIcon:Icon(Icons.email_sharp),hintText: "Email", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0))),)),
              const Padding(padding: EdgeInsets.only(left:30, right: 30, bottom: 0),child: TextField(obscureText: true,decoration: InputDecoration(prefixIcon:Icon(Icons.password_sharp),hintText: "Password", border: OutlineInputBorder(borderSide: BorderSide(width: 5.0)))),),    
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right:15),
                    child: TextButton(onPressed: (){
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Recovery sent to email"),
                          content: Text("Please recover your email and try again"),
                        );
                      });
                    }, child: Text("Forgot password")),
                  ),
                  TextButton(onPressed: (){}, child: Text("Sign-up"))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(onPressed: (){}, child: Text("Login"),
              )  )    
            ],),
          ],
        ),
      ),
    );
  }
}

