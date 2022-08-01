import 'package:flutter/material.dart';

class ProdInvdiv extends StatelessWidget {
  ProdInvdiv({Key? key, required this.product, required this.index})
      : super(key: key);
  String product;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/products', arguments: product);
      },
      child: Card(
        elevation: 7,
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: index % 4 == 2 || index % 4 == 3
                    ? [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0.85)
                      ]
                    : [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.85)
                      ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
