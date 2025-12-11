import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../dtos/zenquotes/zen_quote_dto.dart';

part 'zenquotes_api_client.g.dart';

/// Retrofit API клиент для работы с ZenQuotes API
@RestApi(baseUrl: 'https://zenquotes.io/api')
abstract class ZenQuotesApiClient {
  factory ZenQuotesApiClient(Dio dio, {String baseUrl}) = _ZenQuotesApiClient;

  /// Получение случайной цитаты
  /// GET /api/random
  @GET('/random')
  Future<List<ZenQuoteDto>> getRandomQuote();

  /// Получение цитаты дня (QOTD)
  /// GET /api/today
  @GET('/today')
  Future<List<ZenQuoteDto>> getQuoteOfTheDay();

  /// Получение списка цитат (20 шт.)
  /// GET /api/quotes
  @GET('/quotes')
  Future<List<ZenQuoteDto>> getQuotes();

  /// Поиск цитат по ключевому слову
  /// GET /api/quotes/{keyword}
  @GET('/quotes/{keyword}')
  Future<List<ZenQuoteDto>> searchQuotes(
    @Path('keyword') String keyword,
  );

  /// Получение цитат конкретного автора
  /// GET /api/quotes/{author}
  @GET('/quotes/{author}')
  Future<List<ZenQuoteDto>> getQuotesByAuthor(
    @Path('author') String author,
  );

  /// Получение цитат по категории
  /// GET /api/quotes/{category}
  @GET('/quotes/{category}')
  Future<List<ZenQuoteDto>> getQuotesByCategory(
    @Path('category') String category,
  );
}
