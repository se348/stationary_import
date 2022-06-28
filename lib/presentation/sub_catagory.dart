import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stationary_import/presentation/order_form.dart';

class SubCategory extends StatelessWidget {
  SubCategory({Key? key}) : super(key: key);
  late int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sub-category")),
      body: Column(
        children: [Expanded(
            child: ListView(
          children: [
            for (i = 0; i < 20; i++)
              ListTile(
                leading: const Icon(Icons.print),
                title: const Text('Printer'),
                subtitle:
                    const Text('hp Laser Jet Pro MFP M125nw\n350'),
                trailing: IconButton(
                  onPressed: (){
                    showModalBottomSheet(context: context,isScrollControlled: true, builder: (context){
                      return OrderForm();
                    });
                  },icon: const Icon(Icons.shopping_cart)),
                isThreeLine: true,
              ),
          ],
        )),
        ]
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null, child: Icon(Icons.add),),
    );
  }
}
