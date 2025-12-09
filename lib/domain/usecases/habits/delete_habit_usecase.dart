import 'package:prack_10/domain/repositories/habit_repository.dart';

class DeleteHabitUseCase {
  final HabitRepository _repository;

  DeleteHabitUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteHabit(id);
  }
}

