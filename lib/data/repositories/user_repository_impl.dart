import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';
import 'package:prack_10/data/datasources/user_local_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getAllUsers() async {
    return await _dataSource.getAllUsers();
  }

  @override
  Future<User?> getUserById(String id) async {
    final users = await getAllUsers();
    try {
      return users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final users = await getAllUsers();
    try {
      return users.firstWhere((user) => user.email.toLowerCase() == email.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addUser(User user) async {
    await _dataSource.saveUser(user);
  }

  @override
  Future<void> updateUser(User user) async {
    await _dataSource.saveUser(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    final currentUser = await getCurrentUser();
    if (currentUser?.id == id) {
      await logout();
    }
  }

  /// Выполнить вход пользователя
  @override
  Future<bool> login(String email, String password) async {
    final user = await getUserByEmail(email);
    if (user != null && user.password == password) {
      await _dataSource.saveUser(user);
      await _dataSource.setLoggedIn(true);
      return true;
    }
    return false;
  }

  /// Выйти из аккаунта
  @override
  Future<void> logout() async {
    await _dataSource.logout();
  }


  /// Получить текущего авторизованного пользователя
  @override
  Future<User?> getCurrentUser() async {
    return await _dataSource.getCurrentUser();
  }

  /// Проверить, авторизован ли пользователь
  @override
  Future<bool> isLoggedIn() async {
    return await _dataSource.isLoggedIn();
  }
}
