import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';

class GetHabitByIdUseCase {
  final HabitRepository _repository;

  GetHabitByIdUseCase(this._repository);

  Future<Habit?> call(String id) async {
    return await _repository.getHabitById(id);
  }
}

