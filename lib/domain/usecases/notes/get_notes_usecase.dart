import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository _repository;

  GetNotesUseCase(this._repository);

  Future<List<Note>> call() async {
    return await _repository.getAllNotes();
  }
}

