class Product {
  String? id;
  final String name;
  final String description;
  final int packageAmount;
  final int individualQuantity;
  final String measurement;
  final int price;
  final String category;

  Product(
      {required this.name,
      this.id,
      required this.description,
      required this.packageAmount,
      required this.individualQuantity,
      required this.measurement,
      required this.price,
      required this.category});

  static List<Product> fromJson(List json) {
    List<Product> prods = [];
    for (int i = 0; i < json.length; i++) {
      prods.add(Product(
          name: json[i]['name'],
          description: json[i]['description'],
          packageAmount: json[i]['packageAmount'],
          individualQuantity: json[i]['individualQuantity'],
          measurement: json[i]['measurement'],
          price: json[i]['price'],
          category: json[i]['category'],
          id: json[i]['_id']));
    }
    return prods;
  }

  static Set<String> productsfinding(p) {
    Set<String> products = new Set();
    for (int i = 0; i < p.length; i++) {
      products.add(p[i].category);
    }
    return products;
  }

  static Set<Product> productsWithCategory(
      String category, List<Product> product_lists) {
    Set<Product> products = new Set();
    for (int i = 0; i < product_lists.length; i++) {
      if (category == product_lists[i].category) {
        products.add(product_lists[i]);
      }
    }
    return products;
  }

  factory Product.fromJson1(Map<String, dynamic> json) => Product(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] as double).round(),
        packageAmount: (json['package'] as double).round(),
        measurement: json['measurement'],
        individualQuantity: (json['quantity'] as double).round(),
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'package': packageAmount,
        "measurement": measurement,
        'quantity': individualQuantity,
        'category': category,
      };
}
