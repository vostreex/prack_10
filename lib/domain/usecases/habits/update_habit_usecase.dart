import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';

class UpdateHabitUseCase {
  final HabitRepository _repository;

  UpdateHabitUseCase(this._repository);

  Future<void> call(Habit habit) async {
    await _repository.updateHabit(habit);
  }
}

