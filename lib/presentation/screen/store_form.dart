import 'package:flutter/material.dart';

class StoreForm extends StatelessWidget {
  StoreForm({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController packageAmount = TextEditingController();

  TextEditingController individualQuantity = TextEditingController();

  TextEditingController measurement = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController category = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context)?.settings.arguments;
    category.text = text!=null? text as String : "";
    return Scaffold(
      appBar: AppBar(title: Text("Adding items to the store")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
            child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                TextFormField(
                  controller: name,
                  validator: (val){
                    if (val ==null){
                      return "Please enter product name";
                    }
                    if(val.length<=3 || val.length>=50){
                      return "Product name must be between 3 and 50 charachters";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Product name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 8,
                  controller: description,
                  validator:(val){
                    if (val == null){
                      return "Please enter description about the product";
                    }
                    else if (val.length>255 || val.length<5){
                      return "Products desription must be between 5 and 255 charachters";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Product description"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: price,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if (val == null){
                      return "Please provide price";
                    }
                    return double.tryParse(val) == null? "The price of a product needs to be a number": null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Indivdual price"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: packageAmount,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if (val== null){
                      return "Please provide the total available packages";
                    }
                    return double.tryParse(val) == null? "The packages of a product needs to be a number": null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Total quantity"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: individualQuantity,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if (val== null){
                      return "Please provide the amount of each piece a package contains";
                    }
                    return double.tryParse(val) == null? "The unit of product a package contains needs to be a number": null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Quantity of individual"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: measurement,
                  validator: (val){
                    if(val== null){
                      return "Please provide measurement type of each unit of product";
                    }
                    if (val.length >=30){
                      return "Improper length";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Measurement type"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: category,
                  validator: (val){
                    if(val== null){
                      return "Please provide category of the product";
                    }
                    if (val.length >=30){
                      return "Improper length";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Category"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    TextButton(
                        onPressed: null,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.black87),
                        ))
                  ],
                )
              ]),
            )
          ],
        )),
      ),
    );
  }
}
