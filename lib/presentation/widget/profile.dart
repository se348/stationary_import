import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/model/user.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  User user = User(
      name: "Semir Ahmed",
      role: "admin",
      email: "semir2578@gmail.com",
      phoneNumber: "0984836744");
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Stack(alignment: Alignment.centerLeft, children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/cover.png"))),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey.shade100,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/anonymous.png"),
                      radius: 60,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(fontSize: 22),
                              softWrap: true,
                            ),
                            Text(
                              user.role!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ))
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-profile',
                          arguments: user);
                    },
                    icon: Icon(Icons.edit))
              ]),
              Row(
                children: [
                  const Icon(Icons.email_sharp),
                  Text(user.email),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone),
                  Text(user.phoneNumber),
                ],
              )
            ],
          ),
        ]),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            height: 50,
            child: AppBar(title: const Text("Your profile"), actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/recent-activity");
                  },
                  icon: const Icon(Icons.pending_actions))
            ])),
      ),
      user.role == "admin" || user.role == "manager"
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text("Manage Account"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/confirm-registration");
                  },
                ),
              ))
          : Container()
    ]);
  }
}
