import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'exceptions.dart';
import '../../../dtos/auth/auth_response_dto.dart';
import '../../../dtos/auth/supabase_user_dto.dart';
import '../../../dtos/auth/signup_request_dto.dart';
import '../../../dtos/auth/signin_request_dto.dart';
import '../../../dtos/auth/update_password_request_dto.dart';

/// Data source для работы с Supabase Auth REST API
class SupabaseAuthDataSource {
  final SupabaseDioClient _dioClient;

  SupabaseAuthDataSource(this._dioClient);

  /// Регистрация нового пользователя
  /// POST /auth/v1/signup
  Future<AuthResponseDto> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final requestDto = SignUpRequestDto(email: email, password: password);
      final response = await _dioClient.dio.post(
        '/signup',
        data: requestDto.toJson(),
      );

      return AuthResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw SupabaseAuthException.fromDioException(e);
    }
  }

  /// Вход пользователя
  /// POST /auth/v1/token?grant_type=password
  Future<AuthResponseDto> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final requestDto = SignInRequestDto(email: email, password: password);
      final response = await _dioClient.dio.post(
        '/token',
        queryParameters: {'grant_type': 'password'},
        data: requestDto.toJson(),
      );

      return AuthResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw SupabaseAuthException.fromDioException(e);
    }
  }

  /// Получение текущего пользователя
  /// GET /auth/v1/user
  Future<SupabaseUserDto> getUser(String accessToken) async {
    try {
      final response = await _dioClient.dio.get(
        '/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      return SupabaseUserDto.fromJson(response.data);
    } on DioException catch (e) {
      throw SupabaseAuthException.fromDioException(e);
    }
  }

  /// Обновление токена
  /// POST /auth/v1/token?grant_type=refresh_token
  Future<AuthResponseDto> refreshToken(String refreshToken) async {
    try {
      final response = await _dioClient.dio.post(
        '/token',
        queryParameters: {'grant_type': 'refresh_token'},
        data: {
          'refresh_token': refreshToken,
        },
      );

      return AuthResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw SupabaseAuthException.fromDioException(e);
    }
  }

  /// Выход из системы
  /// POST /auth/v1/logout
  Future<void> logout(String accessToken) async {
    try {
      await _dioClient.dio.post(
        '/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
    } on DioException catch (e) {
      // Игнорируем ошибки при logout, так как токен может быть уже невалидным
      // Но все равно пробрасываем исключение для логирования
      throw SupabaseAuthException.fromDioException(e);
    }
  }

  /// Смена пароля
  /// PUT /auth/v1/user
  Future<void> updatePassword({
    required String accessToken,
    required String newPassword,
  }) async {
    try {
      final requestDto = UpdatePasswordRequestDto(password: newPassword);
      await _dioClient.dio.put(
        '/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: requestDto.toJson(),
      );
    } on DioException catch (e) {
      throw SupabaseAuthException.fromDioException(e);
    }
  }
}
