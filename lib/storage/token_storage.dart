import 'package:flutter_secure_storage/flutter_secure_storage.dart';
enum TokenType {
  accessToken,
  refreshToken
}
class TokenStorage {
  static final _secureStorage = FlutterSecureStorage();
  Future<void> storeAuthToken(String token, TokenType type) async {
    await _secureStorage.write(key: type.toString().toUpperCase(), value: token);
  }
  Future<String> getAuthToken(TokenType type) async {
    return await _secureStorage.read(key: type.toString().toUpperCase()) ?? '';
  }
  Future<void> removeAuthToken(TokenType type) async {
    return await _secureStorage.delete(key: type.toString().toUpperCase());
  }
}