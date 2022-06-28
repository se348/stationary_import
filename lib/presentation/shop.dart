import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade200,
      padding: EdgeInsets.symmetric(vertical:10, horizontal: 5),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/Instagram.jpeg")),
                    border: Border.all(color: Colors.blueGrey, width: 5)
                    ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5/3,
                  ),
              children: [
                Card(
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.laptop),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Electronics"),
                    ],
                  ),
                  elevation: 5,
                ),
                Card(
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Schools"),
                    ],
                  ),
                  elevation: 5,
                ),
                Card(
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.backup),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Backups"),
                    ],
                  ),
                  elevation: 5,
                ),
                Card(
                  color: Colors.blueGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Books"),
                    ],
                  ),
                  elevation: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
