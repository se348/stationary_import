import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/custom_indicator.dart';
import 'package:stationary_import/presentation/widget/no_internet.dart';
import 'package:stationary_import/provider/logs.dart';
import 'package:intl/intl.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LogsProv>(context, listen: false).getLogs();
    return Scaffold(
      appBar: AppBar(title: const Text("Recent activities")),
      body: Container(
        child: RefreshIndicator(
          onRefresh: (() =>
              Provider.of<LogsProv>(context, listen: false).getLogs()),
          child: Column(children: [
            Expanded(
                child: Consumer<LogsProv>(
              builder: (context, value, child) => value.status == 0
                  ? const Center(
                      child: CustomIndicator(),
                    )
                  : value.status == -2
                      ? const NoInternet()
                      : ListView.builder(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(DateFormat.Hm()
                                            .format(value.logs[index].date)),
                                        Text(DateFormat.yMd()
                                            .format(value.logs[index].date))
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
            ))
          ]),
        ),
      ),
    );
  }
}
