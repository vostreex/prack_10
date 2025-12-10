import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/data/dtos/user_dto.dart';
import 'dart:convert';

/// Data source для хранения пользовательских данных через Flutter Secure Storage
class UserLocalDataSource {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _keyUserId = 'userId';
  static const String _keyUserName = 'userName';
  static const String _keyUserEmail = 'userEmail';
  static const String _keyUserPassword = 'userPassword';
  static const String _keyAccessToken = 'accessToken';
  static const String _keyRefreshToken = 'refreshToken';
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyUserData = 'userData'; // Полный объект User в JSON

  /// Сохранить пользователя в secure storage
  Future<void> saveUser(User user) async {
    final userDto = UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
    );
    final userJson = jsonEncode(userDto.toJson());
    
    await _storage.write(key: _keyUserData, value: userJson);
    await _storage.write(key: _keyUserId, value: user.id);
    await _storage.write(key: _keyUserName, value: user.name);
    await _storage.write(key: _keyUserEmail, value: user.email);
    await _storage.write(key: _keyUserPassword, value: user.password);
  }

  /// Получить текущего пользователя из secure storage
  Future<User?> getCurrentUser() async {
    try {
      final userJson = await _storage.read(key: _keyUserData);
      if (userJson == null) return null;

      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      final userDto = UserDto.fromJson(userMap);
      
      return User(
        id: userDto.id,
        name: userDto.name,
        email: userDto.email,
        password: userDto.password,
      );
    } catch (e) {
      return null;
    }
  }

  /// Получить ID пользователя
  Future<String?> getUserId() async {
    return await _storage.read(key: _keyUserId);
  }

  /// Получить email пользователя
  Future<String?> getUserEmail() async {
    return await _storage.read(key: _keyUserEmail);
  }

  /// Получить имя пользователя
  Future<String?> getUserName() async {
    return await _storage.read(key: _keyUserName);
  }

  /// Сохранить токен доступа
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  /// Получить токен доступа
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  /// Сохранить refresh токен
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  /// Получить refresh токен
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  /// Установить флаг авторизации
  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _storage.write(key: _keyIsLoggedIn, value: isLoggedIn.toString());
  }

  /// Проверить, авторизован ли пользователь
  Future<bool> isLoggedIn() async {
    final value = await _storage.read(key: _keyIsLoggedIn);
    return value == 'true';
  }

  /// Очистить все данные пользователя (logout)
  Future<void> clearUserData() async {
    await _storage.delete(key: _keyUserData);
    await _storage.delete(key: _keyUserId);
    await _storage.delete(key: _keyUserName);
    await _storage.delete(key: _keyUserEmail);
    await _storage.delete(key: _keyUserPassword);
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyIsLoggedIn);
  }

  Future<void> logout() async {
    await _storage.write(key: _keyIsLoggedIn, value: 'false');
  }

  /// Получить всех пользователей (для совместимости со старым API)
  /// В новой архитектуре это не используется, но оставлено для обратной совместимости
  Future<List<User>> getAllUsers() async {
    final currentUser = await getCurrentUser();
    if (currentUser != null) {
      return [currentUser];
    }
    return [];
  }
}
