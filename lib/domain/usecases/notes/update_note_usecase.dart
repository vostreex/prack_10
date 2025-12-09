import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository _repository;

  UpdateNoteUseCase(this._repository);

  Future<void> call(Note note) async {
    await _repository.updateNote(note);
  }
}

