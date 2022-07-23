import 'package:flutter/material.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/empty_box.jpeg",
            width: MediaQuery.of(context).size.width),
        Text(
          "There is no product available in the database",
          style: Theme.of(context).textTheme.titleMedium,
          softWrap: true,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
