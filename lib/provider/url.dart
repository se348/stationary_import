class URL {
  static String base = "http://10.0.2.2:3000";
  static String unconfirmedUser = "$base/api/unconfirmed_users";
  static String login = '$base/api/auth';
  static String user = '$base/api/users';
  static String product = '$base/api/products';
  static String me = '$user/me';
  static String password = '$user/password';
  static String order = '$base/api/temporary_orders';
  static String logs = '$base/api/logs';
  static String token = "";
}
