import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/login_prov.dart';

class GoToHomeScreen extends StatefulWidget {
  const GoToHomeScreen({Key? key}) : super(key: key);

  @override
  State<GoToHomeScreen> createState() => _GoToHomeScreenState();
}

class _GoToHomeScreenState extends State<GoToHomeScreen> {
  @override
  void didChangeDependencies() {
    print("here");
    Provider.of<LoginProv>(context, listen: false).deleteToken();
    Navigator.of(context).pushReplacementNamed('/');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
