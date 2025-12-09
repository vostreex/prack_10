import 'package:prack_10/domain/repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository _repository;

  DeleteNoteUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteNote(id);
  }
}

