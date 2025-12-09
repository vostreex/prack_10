import 'package:prack_10/domain/repositories/motivation_repository.dart';

class GetMotivationCategoriesUseCase {
  final MotivationRepository _repository;

  GetMotivationCategoriesUseCase(this._repository);

  Future<List<String>> call() async {
    return await _repository.getCategories();
  }
}

