import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository _repository;

  AddNoteUseCase(this._repository);

  Future<void> call(Note note) async {
    await _repository.addNote(note);
  }
}

