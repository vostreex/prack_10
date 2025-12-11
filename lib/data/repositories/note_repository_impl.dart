import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';
import 'package:prack_10/data/datasources/local/note_local_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource _dataSource;

  NoteRepositoryImpl(this._dataSource);

  @override
  Future<List<Note>> getAllNotes() async {
    return await _dataSource.getAllNotes();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    return await _dataSource.getNoteById(id);
  }

  @override
  Future<void> addNote(Note note) async {
    await _dataSource.addNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await _dataSource.updateNote(note);
  }

  @override
  Future<void> deleteNote(String id) async {
    await _dataSource.deleteNote(id);
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final note = await getNoteById(id);
    if (note != null) {
      await updateNote(note.copyWith(isFavorite: !note.isFavorite));
    }
  }

  @override
  Future<void> toggleArchive(String id) async {
    final note = await getNoteById(id);
    if (note != null) {
      await updateNote(note.copyWith(isArchived: !note.isArchived));
    }
  }

  @override
  Future<List<String>> getCategories() async {
    return _dataSource.getCategories();
  }
}
