abstract class MotivationRepository {
  Future<Map<String, List<String>>> getQuotes();
  Future<Map<String, List<String>>> getFacts();
  Future<List<String>> getQuotesByCategory(String category);
  Future<List<String>> getFactsByCategory(String category);
  Future<List<String>> getCategories();
}

