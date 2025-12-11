import 'package:prack_10/core/models/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(String id);
  Future<User?> getUserByEmail(String email);
  Future<void> addUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String id);
  
  // Методы для авторизации через Supabase
  Future<bool> signUp({
    required String email,
    required String password,
    String? name,
  });
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<bool> isLoggedIn();
  Future<void> updatePassword(String newPassword);
}

