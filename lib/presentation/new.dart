import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/presentation/shop.dart';

import 'profile.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  final items= [Shop(), Profile()];
  int curr_index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: (index){
        setState(() {
          curr_index =index;
        });
      },
      selectedItemColor: Colors.black,
      currentIndex: curr_index,
      ) ,
      body: items[curr_index],
    ); 
  }
}