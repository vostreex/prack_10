import 'package:prack_10/domain/repositories/reflection_repository.dart';

class GetQuestionsUseCase {
  final ReflectionRepository _repository;

  GetQuestionsUseCase(this._repository);

  Future<List<String>> call() async {
    return await _repository.getQuestions();
  }
}

