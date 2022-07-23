import 'package:flutter/material.dart';
import 'package:stationary_import/model/product.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  List<String> ps = Product.productsfinding(PRODUCTS).toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: ps.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/products',
                      arguments: ps[index]);
                },
                child: Card(
                  elevation: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: index % 4 == 2 || index % 4 == 3
                                ? [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.85)
                                  ]
                                : [
                                    Theme.of(context).colorScheme.secondary,
                                    Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.85)
                                  ]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ps[index].toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 5 / 3,
            ),
          ),
        )
      ],
    );
  }
}
