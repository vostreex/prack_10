import 'package:prack_10/domain/repositories/note_repository.dart';

class GetCategoriesUseCase {
  final NoteRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<List<String>> call() async {
    return await _repository.getCategories();
  }
}

