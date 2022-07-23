import 'dart:ui';

import 'package:flutter/material.dart';

class PassworsChange extends StatelessWidget {
  const PassworsChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change password")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          "assets/cover.png",
                          height: 150,
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 12),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: "old password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5.0))),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 12),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_rounded),
                              hintText: "new password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5.0))),
                        )),
                    const Padding(
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 12),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password_rounded),
                              hintText: "confirm new password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5.0))),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("save changes"),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
