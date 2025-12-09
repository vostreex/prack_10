import 'package:prack_10/domain/repositories/motivation_repository.dart';

class GetQuotesUseCase {
  final MotivationRepository _repository;

  GetQuotesUseCase(this._repository);

  Future<Map<String, List<String>>> call() async {
    return await _repository.getQuotes();
  }
}

