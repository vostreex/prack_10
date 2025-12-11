import '../../core/models/motivation_item.dart';

abstract class MotivationRepository {
  Future<Map<String, List<String>>> getQuotes();
  Future<Map<String, List<String>>> getFacts();
  Future<List<String>> getQuotesByCategory(String category);
  Future<List<String>> getFactsByCategory(String category);
  Future<List<String>> getCategories();
  
  // Новые методы для работы с ZenQuotes API
  Future<MotivationItem> getRandomQuote();
  Future<MotivationItem> getQuoteOfTheDay();
  Future<List<MotivationItem>> searchQuotes(String query);
  Future<List<MotivationItem>> getQuotesByAuthor(String author);
}

