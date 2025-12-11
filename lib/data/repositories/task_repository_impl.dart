import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';

import '../datasources/local/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<List<Task>> getAllTasks() async {
    return await _dataSource.getAllTasks();
  }

  @override
  Future<Task?> getTaskById(String id) async {
    return await _dataSource.getTaskById(id);
  }

  @override
  Future<void> addTask(Task task) async {
    await _dataSource.addTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _dataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _dataSource.deleteTask(id);
  }
}
