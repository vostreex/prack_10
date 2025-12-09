import 'package:prack_10/domain/repositories/habit_repository.dart';

class ToggleTodayHabitUseCase {
  final HabitRepository _repository;

  ToggleTodayHabitUseCase(this._repository);

  Future<void> call(String id, DateTime date) async {
    await _repository.toggleTodayHabit(id, date);
  }
}

