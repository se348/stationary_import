import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Token {
  static final storage = new FlutterSecureStorage();
  static final keyToken = 'token_stat';
  static Future<void> writeToken(String value) async {
    await storage.write(
        key: keyToken, value: value, aOptions: _getAndroidOptions());
  }

  static Future<String?> getToken() async {
    var readData =
        await storage.read(key: keyToken, aOptions: _getAndroidOptions());
    return readData;
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: keyToken, aOptions: _getAndroidOptions());
  }

  static Future<bool> containsKeyInSecureData() async {
    var containsKey = await storage.containsKey(
        key: keyToken, aOptions: _getAndroidOptions());
    return containsKey;
  }

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
}
