import 'package:prack_10/domain/repositories/motivation_repository.dart';

import '../datasources/local/motivation_local_datasource.dart';

class MotivationRepositoryImpl implements MotivationRepository {
  final MotivationLocalDataSource _dataSource;

  MotivationRepositoryImpl(this._dataSource);

  @override
  Future<Map<String, List<String>>> getQuotes() async {
    return await _dataSource.getQuotes();
  }

  @override
  Future<Map<String, List<String>>> getFacts() async {
    return await _dataSource.getFacts();
  }

  @override
  Future<List<String>> getQuotesByCategory(String category) async {
    return await _dataSource.getQuotesByCategory(category);
  }

  @override
  Future<List<String>> getFactsByCategory(String category) async {
    return await _dataSource.getFactsByCategory(category);
  }

  @override
  Future<List<String>> getCategories() async {
    return await _dataSource.getCategories();
  }
}
