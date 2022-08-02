import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/login_prov.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProv>(context, listen: false).checkToken();
    return Consumer<LoginProv>(builder: ((context, value, child) {
      if (value.hasToken == true && value.another_status == -1) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/whole", (route) => false);
        });

        return Container();
      }
      if (value.hasToken == false && value.another_status == -1) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/whole", (route) => false);
        });
        return Container();
      }
      return Scaffold(
        body: Container(
            color: Colors.blueGrey,
            child: Center(
              child: Image.asset('assets/cover.png'),
            )),
      );
    }));
  }
}
