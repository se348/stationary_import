import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/indiv_unconf_reg.dart';
import 'package:stationary_import/provider/unconfirmed_users.dart';

import '../../model/user.dart';

class ConfirmRegistration extends StatefulWidget {
  ConfirmRegistration({Key? key}) : super(key: key);

  @override
  State<ConfirmRegistration> createState() => _ConfirmRegistrationState();
}

class _ConfirmRegistrationState extends State<ConfirmRegistration> {
  int i = 0;
  bool isInit = false;
  int status = -1;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      Provider.of<UnconfirmedUsers>(context)
          .getUnconfirmedUsers()
          .then((value) => status = value);
    }
    setState(() {
      isInit = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UnconfirmedUsers>(context).getUnconfirmedUsers();
    return Consumer<UnconfirmedUsers>(
      builder: (context, value, child) {
        return status == 200
            ? Scaffold(
                appBar: AppBar(title: Text("Unconfirmed users")),
                body: Container(
                    child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return IndividualUser(user: value.users[index]);
                        }),
                        itemCount: value.users.length,
                      ),
                    ),
                  ],
                )),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
