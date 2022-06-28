import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [Column(
              children: [
                Expanded(flex:1 ,child: Container(width: double.infinity, decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/cover.png"))),)),
                Expanded(flex:1, child: Container(color: Colors.blueGrey.shade100,))
              ],
            ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/anonymous.png"),
                          radius: 60,
                        ),
                        Container(padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:const [
                                        Text("Semir Ahmed",
                                          style: TextStyle(fontSize: 22),),
                                          Text("Admininstrator", style: TextStyle(fontWeight: FontWeight.bold),)
                                      ],
                                    ))
                      ],
                    ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                    ]
                  ),
                  Row(
                    children: const[
                      Icon(Icons.email_sharp),
                      Text("Semir2578@gmail.com"),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.phone),
                      Text("0984836744"),
                    ],
                  )
                ],
              ),
            ]
          ),
    );
  }
}