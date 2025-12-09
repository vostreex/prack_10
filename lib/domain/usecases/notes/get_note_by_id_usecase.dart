import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';

class GetNoteByIdUseCase {
  final NoteRepository _repository;

  GetNoteByIdUseCase(this._repository);

  Future<Note?> call(String id) async {
    return await _repository.getNoteById(id);
  }
}

