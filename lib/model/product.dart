class Product {
  final String name;
  final String description;
  final int packageAmount;
  final double individualQuantity;
  final String measurement;
  final double price;
  final String category;

  Product(
      {required this.name,
      required this.description,
      required this.packageAmount,
      required this.individualQuantity,
      required this.measurement,
      required this.price,
      required this.category});

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
}

List<Product> PRODUCTS = [
  Product(
      name: "lexi",
      description: "this is sharp pen",
      packageAmount: 500,
      individualQuantity: 20,
      measurement: "piece",
      price: 120,
      category: "pen"),
  Product(
      name: "bic",
      description: "this is sharp pen",
      packageAmount: 400,
      individualQuantity: 10,
      measurement: "piece",
      price: 70.0,
      category: "pen"),
  Product(
      name: "sinarline",
      description: "this is the best excercice",
      packageAmount: 400,
      individualQuantity: 10,
      measurement: "piece",
      price: 90.0,
      category: "excercise book"),
  Product(
      name: "lexi",
      description: "this is sharp pen",
      packageAmount: 500,
      individualQuantity: 20,
      measurement: "piece",
      price: 120,
      category: "pen1"),
  Product(
      name: "bic",
      description: "this is sharp pen",
      packageAmount: 400,
      individualQuantity: 10,
      measurement: "piece",
      price: 70.0,
      category: "pen2"),
  Product(
      name: "sinarline",
      description: "this is the best excercice",
      packageAmount: 400,
      individualQuantity: 10,
      measurement: "piece",
      price: 90.0,
      category: "excercise1 book"),
];
