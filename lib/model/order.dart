class Order {
  String? id;
  String product;
  int quantity;
  String user;
  Order(
      {this.id,
      required this.product,
      required this.quantity,
      required this.user});

  static List<Order> fromJson(json) {
    List<Order> orders = [];
    for (int i = 0; i < json.length; i++) {
      orders.add(Order(
          product: json[i]['product']['name'],
          user: json[i]['user']['name'],
          quantity: json[i]['quantity'],
          id: json[i]['_id']));
    }
    return orders;
  }
}
