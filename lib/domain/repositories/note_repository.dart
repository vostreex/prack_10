import 'package:prack_10/core/models/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<Note?> getNoteById(String id);
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> toggleFavorite(String id);
  Future<void> toggleArchive(String id);
  Future<List<String>> getCategories();
}

