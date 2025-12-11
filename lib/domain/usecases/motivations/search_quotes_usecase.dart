import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/core/models/motivation_item.dart';

class SearchQuotesUseCase {
  final MotivationRepository _repository;

  SearchQuotesUseCase(this._repository);

  Future<List<MotivationItem>> call(String query) async {
    return await _repository.searchQuotes(query);
  }
}
