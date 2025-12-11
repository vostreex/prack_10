import 'package:dio/dio.dart';
import 'interceptors.dart';

/// Клиент Dio для работы с Supabase Auth API
class SupabaseDioClient {
  static const String _baseUrl = 'https://nyocfeafugdytikpfdeq.supabase.co/auth/v1';
  static const String _apiKey = 'sb_publishable_t8z7wMhB98xAWsm0F-EoPQ_P4T-sD_g';

  late final Dio _dio;

  SupabaseDioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'apikey': _apiKey,
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    // Добавляем перехватчики
    _dio.interceptors.add(SupabaseAuthInterceptor());
  }

  Dio get dio => _dio;
}
