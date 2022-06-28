import "package:flutter/material.dart";
import 'package:stationary_import/presentation/new.dart';

import 'presentation/login_page.dart';
import 'presentation/sign_up_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const New(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.black54,
          secondary: Colors.blueGrey.shade800,
          tertiary: Colors.black38,
          background: Colors.blueGrey.shade300,
          
        )
      )
    );
  }
}