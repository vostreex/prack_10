import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';

class GetHabitsUseCase {
  final HabitRepository _repository;

  GetHabitsUseCase(this._repository);

  Future<List<Habit>> call() async {
    return await _repository.getAllHabits();
  }
}

