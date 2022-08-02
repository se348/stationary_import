import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/pending_order.dart';
import 'package:stationary_import/presentation/screen/shop.dart';
import 'package:stationary_import/provider/login_prov.dart';

import '../../model/user.dart';
import '../../provider/product_prov.dart';
import '../../provider/profile_pov.dart';
import '../widget/profile.dart';

class Whole extends StatefulWidget {
  Whole({Key? key}) : super(key: key);
  User user = User(
      name: "semir ahmed",
      email: "semir2578@gmail",
      phoneNumber: "0984836744",
      role: "admin");
  @override
  State<Whole> createState() => _WholeState();
}

class _WholeState extends State<Whole> {
  List? items;
  @override
  void initState() {
    items = widget.user.role == "admin" || widget.user.role == "manager"
        ? [
            ["Categories", Shop()],
            ["Profile", Profile()],
            ["Pending Orders", PendingOrder()],
          ]
        : [
            ["Categories", Shop()],
            ["Profile", Profile()]
          ];
  }

  int curr_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items![curr_index][0]),
        actions: curr_index == 1
            ? [
                IconButton(
                    onPressed: (() {
                      Navigator.of(context).pushNamed("/recent-activity");
                    }),
                    icon: const Icon(Icons.punch_clock)),
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: (() async {
                    await Provider.of<LoginProv>(context).deleteToken();
                    Navigator.of(context).pushReplacementNamed("/");
                  }),
                ),
              ]
            : null,
      ),
      floatingActionButton: curr_index == 0
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                final status =
                    await Navigator.pushNamed(context, "/store-form");
                if (status == 1) {
                  await Provider.of<ProductProvider>(context, listen: false)
                      .getProducts();
                }
              })
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: widget.user.role == "admin" || widget.user.role == "manager"
            ? [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Shop"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.pending), label: "new"),
              ]
            : [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Shop"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
        onTap: (index) {
          setState(() {
            curr_index = index;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: curr_index,
      ),
      body: curr_index == 1
          ? RefreshIndicator(
              child: items![curr_index][1],
              onRefresh: () {
                return Provider.of<ProfileProv>(context).getMyInfo();
              },
            )
          : items![curr_index][1],
    );
  }
}
