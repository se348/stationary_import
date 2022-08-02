import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/user.dart';
import 'package:stationary_import/provider/profile_pov.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  int status = -1;

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    email.text = user.email;
    phone.text = user.phoneNumber!;
    return Form(
      child: Scaffold(
        appBar: AppBar(title: Text("Edit profile")),
        body: Column(
          children: [
            Expanded(
              child: ListView(
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
                            controller: email,
                            textInputAction: TextInputAction.next,
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
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 12),
                          child: TextFormField(
                            controller: phone,
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
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Phone",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 5.0))),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/change-password",
                                arguments: user);
                          },
                          child: Text("change password")),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Consumer<ProfileProv>(
                            builder: (context, value, child) => ElevatedButton(
                              onPressed: value.status == 0
                                  ? null
                                  : (() async {
                                      await Provider.of<ProfileProv>(context,
                                              listen: false)
                                          .changeMyinfo(user.name!, phone.text,
                                              email.text);
                                      if (value.status == 200) {
                                        Navigator.of(context).pop(status);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Succeeded")));
                                      }
                                      if (value.status == 400) {
                                        Navigator.of(context).pop(status);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("Failed")));
                                      }
                                      if (value.status == -2) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("No internet")));
                                      }
                                    }),
                              child: value.status == 0
                                  ? const CircularProgressIndicator()
                                  : const Text("save changes"),
                            ),
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
