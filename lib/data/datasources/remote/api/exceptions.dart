import 'package:dio/dio.dart';

/// Исключение для ошибок авторизации Supabase
class SupabaseAuthException implements Exception {
  final String message;
  final int? statusCode;
  final DioException? dioException;

  SupabaseAuthException({
    required this.message,
    this.statusCode,
    this.dioException,
  });

  factory SupabaseAuthException.fromDioException(DioException e) {
    String message = 'Ошибка авторизации';
    int? statusCode;
    
    if (e.response != null) {
      statusCode = e.response!.statusCode;
      final data = e.response!.data;
      
      if (data is Map<String, dynamic>) {
        if (data.containsKey('error_description')) {
          message = data['error_description'] as String;
        } else if (data.containsKey('message')) {
          message = data['message'] as String;
        } else if (data.containsKey('error')) {
          message = data['error'] as String;
        }
      }
      
      // Обработка стандартных HTTP статус кодов
      if (statusCode == 400) {
        message = message == 'Ошибка авторизации' 
            ? 'Неверный email или пароль' 
            : message;
      } else if (statusCode == 401) {
        message = message == 'Ошибка авторизации' 
            ? 'Неверные учетные данные' 
            : message;
      } else if (statusCode == 422) {
        message = message == 'Ошибка авторизации' 
            ? 'Некорректные данные' 
            : message;
      } else if (statusCode == 429) {
        message = 'Слишком много запросов. Попробуйте позже';
      } else if (statusCode == 500) {
        message = 'Внутренняя ошибка сервера. Попробуйте позже';
      }
      
      return SupabaseAuthException(
        message: message,
        statusCode: statusCode,
        dioException: e,
      );
    }
    
    // Обработка ошибок сети
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      message = 'Превышено время ожидания. Проверьте подключение к интернету';
    } else if (e.type == DioExceptionType.connectionError) {
      message = 'Ошибка подключения. Проверьте интернет-соединение';
    } else if (e.type == DioExceptionType.sendTimeout) {
      message = 'Превышено время отправки запроса';
    }
    
    return SupabaseAuthException(
      message: message,
      dioException: e,
    );
  }

  @override
  String toString() => message;
}
