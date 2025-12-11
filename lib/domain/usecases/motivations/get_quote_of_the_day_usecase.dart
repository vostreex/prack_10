import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/core/models/motivation_item.dart';

class GetQuoteOfTheDayUseCase {
  final MotivationRepository _repository;

  GetQuoteOfTheDayUseCase(this._repository);

  Future<MotivationItem> call() async {
    return await _repository.getQuoteOfTheDay();
  }
}
