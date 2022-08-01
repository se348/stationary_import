import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/model/user.dart';
import 'package:stationary_import/provider/unconfirmed_users.dart';

class IndividualUser extends StatefulWidget {
  IndividualUser({Key? key, required this.user}) : super(key: key);

  User user;
  @override
  State<IndividualUser> createState() => _IndividualUserState();
}

class _IndividualUserState extends State<IndividualUser> {
  String role = "employee";
  int status = -1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user.name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.email),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(widget.user.phoneNumber!),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InputChip(
                            label: const Text("Retailer"),
                            selected: role == "retailer",
                            onSelected: (val) {
                              setState(() {
                                role = "retailer";
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: InputChip(
                            label: const Text("Employee"),
                            selected: role == "employee",
                            onSelected: (val) {
                              setState(() {
                                role = "employee";
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: InputChip(
                            label: const Text("Manager"),
                            selected: role == "manager",
                            onSelected: (val) {
                              setState(() {
                                role = "manager";
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 10,
                  backgroundImage: AssetImage("assets/anonymous.png")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () async {
                    status = await Provider.of<UnconfirmedUsers>(context,
                            listen: false)
                        .confirmUser(widget.user.id!, role, 0);
                  },
                  child: const Text("No")),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                  onPressed: () async {
                    status = await Provider.of<UnconfirmedUsers>(context,
                            listen: false)
                        .confirmUser(widget.user.id!, role, 1);
                  },
                  child: Text("Yes")),
              SizedBox(
                width: 8,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
