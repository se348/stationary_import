import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/custom_indicator.dart';
import 'package:stationary_import/provider/login_prov.dart';

import '../../model/user.dart';
import '../../services/token_rel.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cat = context;
    return Consumer<LoginProv>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Image.asset(
                  "assets/cover.png",
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 5),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_sharp),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5.0))),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, bottom: 0),
                      child: TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password_sharp),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 5.0)))),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 15),
                          child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        title: Text("Recovery sent to email"),
                                        content: Text(
                                            "Please recover your email and try again"),
                                      );
                                    });
                              },
                              child: const Text("Forgot password")),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: const Text("Sign-up"))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Consumer<LoginProv>(
                          builder: (context, value, child) => ElevatedButton(
                            onPressed: value.status == 0
                                ? null
                                : () async {
                                    await Provider.of<LoginProv>(context,
                                            listen: false)
                                        .loginUser(
                                      User(
                                          email: email.text,
                                          password: password.text),
                                    );
                                    if (value.status == 200) {
                                      Navigator.pushReplacementNamed(
                                          cat, "/whole");
                                    }
                                    if (value.status == 400) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                        "Email or password incorrect",
                                      )));
                                    }
                                    if (value.status == -2) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                        "No internet connection",
                                      )));
                                    }
                                  },
                            child: value.status == 0
                                ? const CustomIndicator()
                                : const Text("Login"),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
