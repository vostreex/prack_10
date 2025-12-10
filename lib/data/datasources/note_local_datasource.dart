import 'package:sqflite/sqflite.dart';
import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/data/dtos/note_dto.dart';
import 'package:prack_10/data/mappers/note_mapper.dart';
import 'app_database.dart';

/// Data source для хранения заметок в SQLite
class NoteLocalDataSource {
  static const String _tableName = 'notes';

  static const List<String> categories = [
    'Все категории',
    'Без категории',
    'Работа',
    'Личное',
    'Учёба',
  ];

  /// Получить все заметки
  Future<List<Note>> getAllNotes() async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return maps.map((map) => NoteMapper.fromDto(NoteDto.fromMap(map))).toList();
  }

  /// Получить заметку по ID
  Future<Note?> getNoteById(String id) async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return NoteMapper.fromDto(NoteDto.fromMap(maps.first));
  }

  /// Добавить заметку
  Future<void> addNote(Note note) async {
    final db = await AppDatabase.instance();
    final dto = NoteMapper.toDto(note);
    await db.insert(_tableName, dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Обновить заметку
  Future<void> updateNote(Note note) async {
    final db = await AppDatabase.instance();
    final dto = NoteMapper.toDto(note);
    await db.update(
      _tableName,
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  /// Удалить заметку
  Future<void> deleteNote(String id) async {
    final db = await AppDatabase.instance();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Получить список категорий
  List<String> getCategories() {
    return categories;
  }
}
