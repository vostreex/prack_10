import 'package:sqflite/sqflite.dart';
import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/data/dtos/reflection_dto.dart';
import 'package:prack_10/data/mappers/reflection_mapper.dart';
import 'app_database.dart';

/// Data source для хранения рефлексий в SQLite
class ReflectionLocalDataSource {
  static const String _tableName = 'reflections';

  static const List<String> reflectionQuestions = [
    'Что было самым ярким моментом дня?',
    'Что вас огорчило или вызвало трудности?',
    'За что вы благодарны сегодня?',
    'Какие уроки вы извлекли?',
  ];

  /// Получить все рефлексии
  Future<List<ReflectionEntry>> getAllReflections() async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'creationDate DESC',
    );
    return maps.map((map) => ReflectionMapper.fromDto(ReflectionDto.fromMap(map))).toList();
  }

  /// Получить рефлексию по ID
  Future<ReflectionEntry?> getReflectionById(String id) async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return ReflectionMapper.fromDto(ReflectionDto.fromMap(maps.first));
  }

  /// Добавить рефлексию
  Future<void> addReflection(ReflectionEntry reflection) async {
    final db = await AppDatabase.instance();
    final dto = ReflectionMapper.toDto(reflection);
    await db.insert(_tableName, dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Обновить рефлексию
  Future<void> updateReflection(ReflectionEntry reflection) async {
    final db = await AppDatabase.instance();
    final dto = ReflectionMapper.toDto(reflection);
    await db.update(
      _tableName,
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [reflection.id],
    );
  }

  /// Удалить рефлексию
  Future<void> deleteReflection(String id) async {
    final db = await AppDatabase.instance();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Получить список вопросов для рефлексии
  List<String> getQuestions() {
    return reflectionQuestions;
  }
}
