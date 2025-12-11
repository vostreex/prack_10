import 'package:sqflite/sqflite.dart';
import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/data/dtos/habit_dto.dart';
import 'package:prack_10/data/mappers/habit_mapper.dart';
import 'app_database.dart';

/// Data source для хранения привычек в SQLite
class HabitLocalDataSource {
  static const String _tableName = 'habits';

  /// Получить все привычки
  Future<List<Habit>> getAllHabits() async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return maps.map((map) => HabitMapper.fromDto(HabitDto.fromMap(map))).toList();
  }

  /// Получить привычку по ID
  Future<Habit?> getHabitById(String id) async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return HabitMapper.fromDto(HabitDto.fromMap(maps.first));
  }

  /// Добавить привычку
  Future<void> addHabit(Habit habit) async {
    final db = await AppDatabase.instance();
    final dto = HabitMapper.toDto(habit);
    await db.insert(_tableName, dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Обновить привычку
  Future<void> updateHabit(Habit habit) async {
    final db = await AppDatabase.instance();
    final dto = HabitMapper.toDto(habit);
    await db.update(
      _tableName,
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [habit.id],
    );
  }

  /// Удалить привычку
  Future<void> deleteHabit(String id) async {
    final db = await AppDatabase.instance();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Удалить все привычки
  Future<void> deleteAllHabits() async {
    final db = await AppDatabase.instance();
    await db.delete(_tableName);
  }
}
