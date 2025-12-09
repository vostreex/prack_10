import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<void> call(Task task) async {
    await _repository.updateTask(task);
  }
}

