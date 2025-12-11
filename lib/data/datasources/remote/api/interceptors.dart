import 'package:dio/dio.dart';

/// Перехватчик для Supabase Auth API
class SupabaseAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Можно добавить логирование запросов или дополнительную обработку
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Можно добавить логирование ответов или дополнительную обработку
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Можно добавить дополнительную обработку ошибок
    super.onError(err, handler);
  }
}
