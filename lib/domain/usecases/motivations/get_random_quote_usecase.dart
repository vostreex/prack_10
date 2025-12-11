import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/core/models/motivation_item.dart';

class GetRandomQuoteUseCase {
  final MotivationRepository _repository;

  GetRandomQuoteUseCase(this._repository);

  Future<MotivationItem> call() async {
    return await _repository.getRandomQuote();
  }
}
