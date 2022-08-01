import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/provider/logs.dart';
import 'package:intl/intl.dart';

class RecentActivity extends StatefulWidget {
  RecentActivity({Key? key}) : super(key: key);

  @override
  State<RecentActivity> createState() => _RecentActivityState();
}

class _RecentActivityState extends State<RecentActivity> {
  int i = 0;
  bool isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      Provider.of<LogsProv>(context, listen: false).getLogs();
    }
    setState(() {
      isInit = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LogsProv>(context, listen: false).getLogs();
    return Consumer<LogsProv>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("Recent activities")),
        body: Container(
          child: Column(children: [
            Expanded(
                child: ListView.builder(
              itemCount: value.logs.length,
              itemBuilder: (context, index) => Card(
                elevation: 7,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.logs[index].written),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                DateFormat.Hm().format(value.logs[index].date)),
                            Text(
                                DateFormat.yMd().format(value.logs[index].date))
                          ],
                        )
                      ],
                    )),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
