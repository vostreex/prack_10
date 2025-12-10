import 'package:sqflite/sqflite.dart';
import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/data/dtos/task_dto.dart';
import 'package:prack_10/data/mappers/task_mapper.dart';
import 'app_database.dart';

/// Data source для хранения задач в SQLite
class TaskLocalDataSource {
  static const String _tableName = 'tasks';

  /// Получить все задачи
  Future<List<Task>> getAllTasks() async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return maps.map((map) => TaskMapper.fromDto(TaskDto.fromMap(map))).toList();
  }

  /// Получить задачу по ID
  Future<Task?> getTaskById(String id) async {
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return TaskMapper.fromDto(TaskDto.fromMap(maps.first));
  }

  /// Добавить задачу
  Future<void> addTask(Task task) async {
    final db = await AppDatabase.instance();
    final dto = TaskMapper.toDto(task);
    await db.insert(_tableName, dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Обновить задачу
  Future<void> updateTask(Task task) async {
    final db = await AppDatabase.instance();
    final dto = TaskMapper.toDto(task);
    await db.update(
      _tableName,
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  /// Удалить задачу
  Future<void> deleteTask(String id) async {
    final db = await AppDatabase.instance();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
