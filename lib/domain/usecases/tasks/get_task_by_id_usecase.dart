import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';

class GetTaskByIdUseCase {
  final TaskRepository _repository;

  GetTaskByIdUseCase(this._repository);

  Future<Task?> call(String id) async {
    return await _repository.getTaskById(id);
  }
}

