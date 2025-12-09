import 'package:prack_10/domain/repositories/note_repository.dart';

class ToggleFavoriteNoteUseCase {
  final NoteRepository _repository;

  ToggleFavoriteNoteUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.toggleFavorite(id);
  }
}

