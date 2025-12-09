import 'package:prack_10/domain/repositories/motivation_repository.dart';

class GetFactsUseCase {
  final MotivationRepository _repository;

  GetFactsUseCase(this._repository);

  Future<Map<String, List<String>>> call() async {
    return await _repository.getFacts();
  }
}

