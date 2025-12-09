import 'package:prack_10/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteTask(id);
  }
}

