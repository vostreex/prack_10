import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';
import 'package:prack_10/data/datasources/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<List<Task>> getAllTasks() async {
    return _dataSource.tasks.toList();
  }

  @override
  Future<Task?> getTaskById(String id) async {
    try {
      return _dataSource.tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addTask(Task task) async {
    _dataSource.tasks.add(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _dataSource.tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _dataSource.tasks[index] = task;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    _dataSource.tasks.removeWhere((task) => task.id == id);
  }
}

