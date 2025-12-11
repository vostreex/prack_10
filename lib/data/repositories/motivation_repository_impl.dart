import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/core/models/motivation_item.dart';
import 'package:prack_10/data/datasources/local/motivation_local_datasource.dart';
import 'package:prack_10/data/datasources/remote/motivation_remote_datasource.dart';
import 'package:prack_10/data/mappers/zenquotes_mapper.dart';

class MotivationRepositoryImpl implements MotivationRepository {
  final MotivationLocalDataSource _localDataSource;
  final MotivationRemoteDataSource _remoteDataSource;

  MotivationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  @override
  Future<Map<String, List<String>>> getQuotes() async {
    try {
      // ZenQuotes не поддерживает категории, возвращаем все цитаты под одной категорией
      final quotes = await _remoteDataSource.getQuotes();
      final quotesTexts = quotes.map((q) => '${q.quote} – ${q.author}').toList();
      
      return {'Все категории': quotesTexts};
    } catch (e) {
      // В случае ошибки возвращаем пустой результат
      return {};
    }
  }

  @override
  Future<Map<String, List<String>>> getFacts() async {
    // Факты остаются в локальной БД, так как Quotable API не предоставляет факты
    return await _localDataSource.getFacts();
  }

  @override
  Future<List<String>> getQuotesByCategory(String category) async {
    try {
      if (category == 'Все категории') {
        // Получаем список цитат из ZenQuotes API
        final quotes = await _remoteDataSource.getQuotes();
        return quotes.map((q) => '${q.quote} – ${q.author}').toList();
      }
      
      // Получаем цитаты по категории из ZenQuotes API
      final quotes = await _remoteDataSource.getQuotesByCategory(category.toLowerCase());
      return quotes.map((q) => '${q.quote} – ${q.author}').toList();
    } catch (e) {
      // В случае ошибки возвращаем пустой список
      return [];
    }
  }

  @override
  Future<List<String>> getFactsByCategory(String category) async {
    // Факты остаются в локальной БД
    return await _localDataSource.getFactsByCategory(category);
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      // Предопределенные категории ZenQuotes API
      final zenQuotesCategories = [
        'Все категории',
        'life',
        'love',
        'success',
        'happiness',
        'inspiration',
        'motivation',
        'wisdom',
        'friendship',
        'philosophy',
        'faith',
        'truth',
      ];
      
      // Добавляем категории из локальной БД для фактов
      final localCategories = await _localDataSource.getCategories();
      
      // Объединяем и убираем дубликаты
      final allCategories = <String>{...zenQuotesCategories, ...localCategories}.toList();
      
      return allCategories;
    } catch (e) {
      // В случае ошибки возвращаем дефолтные категории
      return [
        'Все категории',
        'life',
        'love',
        'success',
        'happiness',
        'inspiration',
        'motivation',
        'wisdom',
        'friendship',
        'philosophy',
        'faith',
        'truth',
      ];
    }
  }

  @override
  Future<MotivationItem> getRandomQuote() async {
    try {
      final quoteDto = await _remoteDataSource.getRandomQuote();
      return ZenQuotesMapper.zenQuoteDtoToMotivationItem(quoteDto);
    } catch (e) {
      throw Exception('Ошибка получения случайной цитаты: ${e.toString()}');
    }
  }

  @override
  Future<MotivationItem> getQuoteOfTheDay() async {
    try {
      final quoteDto = await _remoteDataSource.getQuoteOfTheDay();
      return ZenQuotesMapper.zenQuoteDtoToMotivationItem(quoteDto);
    } catch (e) {
      throw Exception('Ошибка получения цитаты дня: ${e.toString()}');
    }
  }

  @override
  Future<List<MotivationItem>> searchQuotes(String query) async {
    try {
      final quotes = await _remoteDataSource.searchQuotes(query);
      return ZenQuotesMapper.zenQuoteDtoListToMotivationItems(quotes);
    } catch (e) {
      throw Exception('Ошибка поиска цитат: ${e.toString()}');
    }
  }

  @override
  Future<List<MotivationItem>> getQuotesByAuthor(String author) async {
    try {
      final quotes = await _remoteDataSource.getQuotesByAuthor(author);
      return ZenQuotesMapper.zenQuoteDtoListToMotivationItems(quotes);
    } catch (e) {
      throw Exception('Ошибка получения цитат автора: ${e.toString()}');
    }
  }
}
