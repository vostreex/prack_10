import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';

class AddHabitUseCase {
  final HabitRepository _repository;

  AddHabitUseCase(this._repository);

  Future<void> call(Habit habit) async {
    await _repository.addHabit(habit);
  }
}

