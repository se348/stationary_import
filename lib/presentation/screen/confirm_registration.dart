import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/indiv_unconf_reg.dart';
import 'package:stationary_import/presentation/widget/no_internet.dart';
import 'package:stationary_import/provider/unconfirmed_users.dart';

import '../../model/user.dart';

class ConfirmRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<UnconfirmedUsers>(context, listen: false).getUnconfirmedUsers();
    return Scaffold(
      appBar: AppBar(title: Text("Unconfirmed users")),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Consumer<UnconfirmedUsers>(
              builder: (context, value, child) => value.status == 0
                  ? const CircularProgressIndicator()
                  : value.status == -2
                      ? const NoInternet()
                      : ListView.builder(
                          itemBuilder: ((context, index) {
                            return IndividualUser(user: value.users[index]);
                          }),
                          itemCount: value.users.length,
                        ),
            ),
          ),
        ],
      )),
    );
  }
}
