import 'package:prack_10/domain/repositories/motivation_repository.dart';

class GetQuotesByCategoryUseCase {
  final MotivationRepository _repository;

  GetQuotesByCategoryUseCase(this._repository);

  Future<List<String>> call(String category) async {
    if (category.trim().isEmpty) {
      throw Exception('Категория не может быть пустой');
    }
    return await _repository.getQuotesByCategory(category);
  }
}

