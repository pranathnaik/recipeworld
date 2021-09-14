import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyUserId = 'userid';

  static Future setUserId(String username) async =>
      await _storage.write(key: _keyUserId, value: username);

  static Future<String> getUserId() async =>
      await _storage.read(key: _keyUserId);

  static Future deleteUserId() async => await _storage.deleteAll();
}
