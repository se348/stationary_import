class User {
  String? name;
  String? role;
  String email;
  String? phoneNumber;
  String? password;
  String? id;
  User({
    this.name,
    this.id,
    this.role,
    required this.email,
    this.phoneNumber,
    this.password,
  });

  static List<User> fromJson(List users) {
    List<User> unconf_users = [];
    for (int i = 0; i < users.length; i++) {
      unconf_users.add(User(
          email: users[i]['email'],
          name: users[i]['name'],
          id: users[i]['_id'],
          phoneNumber: users[i]['phoneNumber']));
    }
    return unconf_users;
  }

  factory User.fromJson1(Map<String, dynamic> json) => User(
      id: json['_id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
      };
}
