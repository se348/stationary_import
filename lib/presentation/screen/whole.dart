import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/presentation/widget/pending_order.dart';
import 'package:stationary_import/presentation/screen/shop.dart';

import '../../model/user.dart';
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
        ? [Shop(), Profile(), PendingOrder()]
        : [Shop(), Profile()];
  }

  int curr_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: widget.user.role == "admin" || widget.user.role == "manager"
            ? [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.pending), label: "new"),
              ]
            : [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
        onTap: (index) {
          setState(() {
            curr_index = index;
          });
        },
        selectedItemColor: Colors.black,
        currentIndex: curr_index,
      ),
      body: items![curr_index],
    );
  }
}
