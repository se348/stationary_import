import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/user.dart';
import 'package:stationary_import/provider/profile_pov.dart';

import '../../provider/unconfirmed_users.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isInit = false;
  int status = -1;
  @override
  void didChangeDependencies() {
    if (isInit == false) {
      Provider.of<ProfileProv>(context, listen: false)
          .getMyInfo()
          .then((value) => status = value)
          .catchError((error) => status = 400);
      setState(() {
        isInit = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProv>(context, listen: false).getMyInfo();
    return Consumer<ProfileProv>(
      builder: ((context, value, child) => status == 0
          ? const CircularProgressIndicator()
          : Stack(children: [
              RefreshIndicator(
                onRefresh: (() async {
                  status =
                      await Provider.of<ProfileProv>(context, listen: false)
                          .getMyInfo();
                }),
                child: Container(
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: const AssetImage(
                                        "assets/anonymous.png"),
                                    radius:
                                        MediaQuery.of(context).size.width / 10,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: FittedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.me?.name ?? "",
                                              style: TextStyle(fontSize: 18),
                                              softWrap: true,
                                            ),
                                            Text(
                                              value.me?.role ?? "employee",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await Navigator.pushNamed(
                                        context, '/edit-profile',
                                        arguments: value.me);
                                  },
                                  icon: Icon(Icons.edit))
                            ]),
                        Row(
                          children: [
                            const Icon(Icons.email_sharp),
                            Text(value.me?.email ?? ""),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            Text(value.me?.phoneNumber ?? ""),
                          ],
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: SafeArea(
              //     child: SizedBox(
              //         height: 50,
              //         child: AppBar(title: const Text("Your profile"), actions: [
              //           IconButton(
              //               onPressed: () {
              //                 Navigator.pushNamed(context, "/recent-activity");
              //               },
              //               icon: const Icon(Icons.pending_actions))
              //         ])),
              //   ),
              // ),
              value.me?.role == "admin" || value.me?.role == "manager"
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: const Text("Manage Account"),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/confirm-registration");
                          },
                        ),
                      ))
                  : Container()
            ])),
    );
  }
}
