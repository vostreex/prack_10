import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';
import 'package:prack_10/data/datasources/note_local_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource _dataSource;

  NoteRepositoryImpl(this._dataSource);

  @override
  Future<List<Note>> getAllNotes() async {
    return _dataSource.notes.toList();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    try {
      return _dataSource.notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addNote(Note note) async {
    _dataSource.notes.add(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    final index = _dataSource.notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _dataSource.notes[index] = note;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    _dataSource.notes.removeWhere((note) => note.id == id);
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final index = _dataSource.notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      final note = _dataSource.notes[index];
      _dataSource.notes[index] = note.copyWith(isFavorite: !note.isFavorite);
    }
  }

  @override
  Future<void> toggleArchive(String id) async {
    final index = _dataSource.notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      final note = _dataSource.notes[index];
      _dataSource.notes[index] = note.copyWith(isArchived: !note.isArchived);
    }
  }

  @override
  Future<List<String>> getCategories() async {
    return _dataSource.getCategories();
  }
}

