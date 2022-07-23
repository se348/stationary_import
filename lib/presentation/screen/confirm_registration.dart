import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/presentation/widget/indiv_unconf_reg.dart';

import '../../model/user.dart';

class ConfirmRegistration extends StatelessWidget {
  ConfirmRegistration({Key? key}) : super(key: key);
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unconfirmed users")),
      body: Container(
        child:Column(
          children: [
            Expanded(child:ListView(children: [
              IndividualUser(user: User(name: "semir ahmed", email: "semir2578@gmail.com", phoneNumber: "0984836744"))
            ]) ,),
          ],
        )
      ),
    );
  }
}