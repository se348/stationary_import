import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/user.dart';
import 'package:stationary_import/provider/signing_prov.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();

  final email = TextEditingController();

  final phoneNumber = TextEditingController();

  final password = TextEditingController();

  final confirmPassword = TextEditingController();
  final key = GlobalKey<FormState>();
  String gender = "male";
  int status = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign up page")),
      body: Column(
        children: [
          Form(
            key: key,
            child: Expanded(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            "assets/cover.png",
                            height: 150,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: name,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter name";
                              }
                              if (val.length < 5 ||
                                  val.contains(RegExp('r[0-9]'))) {
                                return "Name is incorrect";
                              }
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            controller: email,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return "Please enter email";
                              }
                              String p =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(p);
                              return regExp.hasMatch(email) == false
                                  ? "Email is invalid"
                                  : null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_sharp),
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            controller: phoneNumber,
                            validator: (value) {
                              if (value == null) {
                                return "Phone is empty";
                              }
                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(patttern);
                              if (value.length == 0) {
                                return 'Please enter mobile number';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              } else if (value.length != 10) {
                                return "Please enter 10 digit number";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                hintText: "Phone",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 12),
                        child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: password,
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
                            obscureText: true,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password_sharp),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 12),
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: confirmPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (password.text != confirmPassword.text) {
                                return "Password does not match";
                              }
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.password_sharp),
                                hintText: "Confirm-password",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0)))),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Theme(
                                data:
                                    ThemeData(canvasColor: Colors.transparent),
                                child: InputChip(
                                  selected: gender == "male",
                                  onSelected: (val) {
                                    setState(() {
                                      gender = "male";
                                    });
                                  },
                                  label: const Text("Male"),
                                  backgroundColor: Colors.transparent,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Theme(
                                data:
                                    ThemeData(canvasColor: Colors.transparent),
                                child: InputChip(
                                  selected: gender == "female",
                                  onSelected: (val) {
                                    setState(() {
                                      gender = "female";
                                    });
                                  },
                                  label: const Text("Female"),
                                  backgroundColor: Colors.transparent,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Consumer<SigningUp>(
                            builder: (context, value, child) => ElevatedButton(
                              onPressed: value.status == 0
                                  ? null
                                  : () async {
                                      if (key.currentState!.validate()) {
                                        status = await Provider.of<SigningUp>(
                                                context,
                                                listen: false)
                                            .addUser(User(
                                                name: name.text,
                                                email: email.text,
                                                phoneNumber: phoneNumber.text,
                                                password: password.text));
                                        if (value.status == 200) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Succeded!! Wait for email")));
                                          Navigator.of(context).pop();
                                        }
                                        if (value.status == 400) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                            "Email alreay in use",
                                          )));
                                        }
                                        if (value.status == -2) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                            "No internet connection",
                                          )));
                                        }
                                      }
                                    },
                              child: value.status == 0
                                  ? const CircularProgressIndicator()
                                  : const Text("Sign-up"),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
