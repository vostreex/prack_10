import 'package:prack_10/domain/repositories/note_repository.dart';

class ToggleArchiveNoteUseCase {
  final NoteRepository _repository;

  ToggleArchiveNoteUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.toggleArchive(id);
  }
}

