import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository _repository;

  GetTasksUseCase(this._repository);

  Future<List<Task>> call() async {
    return await _repository.getAllTasks();
  }
}

