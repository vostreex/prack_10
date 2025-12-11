import 'package:prack_10/data/datasources/remote/api/zenquotes_api_client.dart';
import 'package:prack_10/data/dtos/zenquotes/zen_quote_dto.dart';

/// Remote data source для работы с ZenQuotes API
class MotivationRemoteDataSource {
  final ZenQuotesApiClient _apiClient;

  MotivationRemoteDataSource(this._apiClient);

  /// Получить случайную цитату
  Future<ZenQuoteDto> getRandomQuote() async {
    try {
      final quotes = await _apiClient.getRandomQuote();
      if (quotes.isEmpty) {
        throw Exception('Пустой ответ от API');
      }
      return quotes.first;
    } catch (e) {
      throw Exception('Ошибка получения случайной цитаты: ${e.toString()}');
    }
  }

  /// Получить цитату дня (QOTD)
  Future<ZenQuoteDto> getQuoteOfTheDay() async {
    try {
      final quotes = await _apiClient.getQuoteOfTheDay();
      if (quotes.isEmpty) {
        throw Exception('Пустой ответ от API');
      }
      return quotes.first;
    } catch (e) {
      throw Exception('Ошибка получения цитаты дня: ${e.toString()}');
    }
  }

  /// Получить список цитат (20 шт.)
  Future<List<ZenQuoteDto>> getQuotes() async {
    try {
      return await _apiClient.getQuotes();
    } catch (e) {
      throw Exception('Ошибка получения списка цитат: ${e.toString()}');
    }
  }

  /// Поиск цитат по ключевому слову
  Future<List<ZenQuoteDto>> searchQuotes(String query) async {
    try {
      return await _apiClient.searchQuotes(query);
    } catch (e) {
      throw Exception('Ошибка поиска цитат: ${e.toString()}');
    }
  }

  /// Получить цитаты конкретного автора
  Future<List<ZenQuoteDto>> getQuotesByAuthor(String author) async {
    try {
      return await _apiClient.getQuotesByAuthor(author);
    } catch (e) {
      throw Exception('Ошибка получения цитат автора: ${e.toString()}');
    }
  }

  /// Получить цитаты по категории
  Future<List<ZenQuoteDto>> getQuotesByCategory(String category) async {
    try {
      return await _apiClient.getQuotesByCategory(category);
    } catch (e) {
      throw Exception('Ошибка получения цитат по категории: ${e.toString()}');
    }
  }
}
