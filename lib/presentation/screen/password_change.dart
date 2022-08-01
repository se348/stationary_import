import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/profile_pov.dart';

import '../../model/user.dart';

class PassworsChange extends StatefulWidget {
  const PassworsChange({Key? key}) : super(key: key);

  @override
  State<PassworsChange> createState() => _PassworsChangeState();
}

class _PassworsChangeState extends State<PassworsChange> {
  bool isInit = false;
  TextEditingController old_password = TextEditingController();
  TextEditingController new_password = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text("Change password")),
      body: Form(
        child: Column(
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
                      Padding(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            obscureText: true,
                            controller: old_password,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                hintText: "old password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            controller: new_password,
                            obscureText: true,
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!regex.hasMatch(value) ||
                                    value.length < 6) {
                                  return 'Enter valid password';
                                } else {
                                  return null;
                                }
                              }
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password_rounded),
                                hintText: "new password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            obscureText: true,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              if (value != new_password.text) {
                                return "The passwords deos not match";
                              }
                            }),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password_rounded),
                                hintText: "confirm new password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Provider.of<ProfileProv>(context, listen: false)
                                  .changeMyPassword(user.id!, old_password.text,
                                      new_password.text)
                                  .then((status) {
                                if (status == 200) {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Successfully changed password")));
                                }
                                if (status == 400) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("password incorrect")));
                                } else {
                                  Navigator.of(context).pop();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Please try again latter")));
                                }
                              });
                            },
                            child: const Text("save changes"),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
