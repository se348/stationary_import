import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/user.dart';
import 'package:stationary_import/presentation/widget/no_internet.dart';
import 'package:stationary_import/provider/profile_pov.dart';

import '../../provider/unconfirmed_users.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProv>(context, listen: false).getMyInfo();
    return Consumer<ProfileProv>(
      builder: ((context, value, child) => value.new_status == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : value.new_status == -2
              ? const NoInternet()
              : Stack(children: [
                  RefreshIndicator(
                    onRefresh: (() async {
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
                                          image:
                                              AssetImage("assets/cover.png"))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            "assets/anonymous.png"),
                                        radius:
                                            MediaQuery.of(context).size.width /
                                                10,
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
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
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                  softWrap: true,
                                                ),
                                                Text(
                                                  value.me?.role ?? "employee",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        final statusa =
                                            await Navigator.pushNamed(
                                                context, '/edit-profile',
                                                arguments: value.me);
                                        await Provider.of<ProfileProv>(context,
                                                listen: false)
                                            .getMyInfo();
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
