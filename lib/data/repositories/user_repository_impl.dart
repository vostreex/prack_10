import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';
import 'package:prack_10/data/datasources/local/user_local_datasource.dart';
import 'package:prack_10/data/datasources/remote/api/supabase_auth_api.dart';
import 'package:prack_10/data/datasources/remote/api/supabase_auth_api.dart' as api;

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _dataSource;
  final SupabaseAuthApi _authApi;

  UserRepositoryImpl(this._dataSource, this._authApi);

  @override
  Future<List<User>> getAllUsers() async {
    return await _dataSource.getAllUsers();
  }

  @override
  Future<User?> getUserById(String id) async {
    final currentUser = await getCurrentUser();
    if (currentUser?.id == id) {
      return currentUser;
    }
    return null;
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final currentUser = await getCurrentUser();
    if (currentUser?.email.toLowerCase() == email.toLowerCase()) {
      return currentUser;
    }
    return null;
  }

  @override
  Future<void> addUser(User user) async {
    // При регистрации через Supabase пользователь создается автоматически
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

  /// Регистрация нового пользователя через Supabase
  @override
  Future<bool> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _authApi.signUp(
        email: email,
        password: password,
      );

      // Сохраняем данные авторизации
      await _dataSource.saveAuthData(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        userId: response.userId ?? '',
        email: response.email ?? email,
        name: name,
      );

      // Получаем полную информацию о пользователе
      final user = await getUser(response.accessToken);
      if (user != null && name != null) {
        await _dataSource.saveUser(User(
          id: user.id,
          name: name,
          email: user.email,
          password: '',
        ));
      }

      return true;
    } on api.AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Ошибка регистрации: ${e.toString()}');
    }
  }

  /// Выполнить вход пользователя через Supabase
  @override
  Future<bool> login(String email, String password) async {
    try {
      final response = await _authApi.signIn(
        email: email,
        password: password,
      );

      // Сохраняем данные авторизации
      await _dataSource.saveAuthData(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        userId: response.userId ?? '',
        email: response.email ?? email,
      );

      // Получаем полную информацию о пользователе
      final user = await getUser(response.accessToken);
      if (user != null) {
        await _dataSource.saveUser(User(
          id: user.id,
          name: user.name ?? '',
          email: user.email,
          password: '',
        ));
      }

      return true;
    } on api.AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Ошибка входа: ${e.toString()}');
    }
  }

  /// Получить информацию о пользователе из Supabase
  Future<api.SupabaseUser?> getUser(String accessToken) async {
    try {
      return await _authApi.getUser(accessToken);
    } catch (e) {
      return null;
    }
  }

  /// Обновить токен доступа
  Future<bool> refreshToken() async {
    try {
      final refreshToken = await _dataSource.getRefreshToken();
      if (refreshToken == null) {
        return false;
      }

      final response = await _authApi.refreshToken(refreshToken);

      // Обновляем токены
      await _dataSource.saveAccessToken(response.accessToken);
      await _dataSource.saveRefreshToken(response.refreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Выйти из аккаунта через Supabase
  @override
  Future<void> logout() async {
    try {
      final accessToken = await _dataSource.getAccessToken();
      if (accessToken != null) {
        await _authApi.logout(accessToken);
      }
    } catch (e) {
      // Игнорируем ошибки при logout
    } finally {
      // Всегда очищаем локальные данные
      await _dataSource.clearUserData();
    }
  }

  /// Получить текущего авторизованного пользователя
  @override
  Future<User?> getCurrentUser() async {
    final isLoggedIn = await _dataSource.isLoggedIn();
    if (!isLoggedIn) {
      return null;
    }

    // Пытаемся обновить информацию о пользователе из Supabase
    final accessToken = await _dataSource.getAccessToken();
    if (accessToken != null) {
      try {
        final supabaseUser = await getUser(accessToken);
        if (supabaseUser != null) {
          final localUser = await _dataSource.getCurrentUser();
          final user = User(
            id: supabaseUser.id,
            name: supabaseUser.name ?? localUser?.name ?? '',
            email: supabaseUser.email,
            password: '',
          );
          // Сохраняем обновленные данные
          await _dataSource.saveUser(user);
          return user;
        }
      } catch (e) {
        // Если токен невалидный, пытаемся обновить его
        final refreshed = await refreshToken();
        if (refreshed) {
          final newAccessToken = await _dataSource.getAccessToken();
          if (newAccessToken != null) {
            try {
              final supabaseUser = await getUser(newAccessToken);
              if (supabaseUser != null) {
                final localUser = await _dataSource.getCurrentUser();
                final user = User(
                  id: supabaseUser.id,
                  name: supabaseUser.name ?? localUser?.name ?? '',
                  email: supabaseUser.email,
                  password: '',
                );
                await _dataSource.saveUser(user);
                return user;
              }
            } catch (e) {
              // Если и после обновления токена не удалось, возвращаем локальные данные
            }
          }
        }
        // Если не удалось обновить токен, возвращаем локальные данные
      }
    }

    return await _dataSource.getCurrentUser();
  }

  /// Проверить, авторизован ли пользователь
  @override
  Future<bool> isLoggedIn() async {
    return await _dataSource.isLoggedIn();
  }

  /// Сменить пароль пользователя через Supabase
  @override
  Future<void> updatePassword(String newPassword) async {
    final accessToken = await _dataSource.getAccessToken();
    if (accessToken == null) {
      throw Exception('Пользователь не авторизован');
    }

    try {
      await _authApi.updatePassword(
        accessToken: accessToken,
        newPassword: newPassword,
      );
    } on api.AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Ошибка смены пароля: ${e.toString()}');
    }
  }
}
