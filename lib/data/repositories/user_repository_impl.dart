import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';
import 'package:prack_10/data/datasources/user_local_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<List<User>> getAllUsers() async {
    return _dataSource.users.toList();
  }

  @override
  Future<User?> getUserById(String id) async {
    try {
      return _dataSource.users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      return _dataSource.users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addUser(User user) async {
    _dataSource.users.add(user);
  }

  @override
  Future<void> updateUser(User user) async {
    final index = _dataSource.users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _dataSource.users[index] = user;
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    _dataSource.users.removeWhere((user) => user.id == id);
  }
}

