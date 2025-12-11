import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/core/models/motivation_item.dart';

class GetQuotesByAuthorUseCase {
  final MotivationRepository _repository;

  GetQuotesByAuthorUseCase(this._repository);

  Future<List<MotivationItem>> call(String author) async {
    return await _repository.getQuotesByAuthor(author);
  }
}
