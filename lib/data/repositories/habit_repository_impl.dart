import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';

import '../datasources/local/habit_local_datasource.dart';


class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource _dataSource;

  HabitRepositoryImpl(this._dataSource);

  @override
  Future<List<Habit>> getAllHabits() async {
    return await _dataSource.getAllHabits();
  }

  @override
  Future<Habit?> getHabitById(String id) async {
    return await _dataSource.getHabitById(id);
  }

  @override
  Future<void> addHabit(Habit habit) async {
    await _dataSource.addHabit(habit);
  }

  @override
  Future<void> updateHabit(Habit habit) async {
    await _dataSource.updateHabit(habit);
  }

  @override
  Future<void> deleteHabit(String id) async {
    await _dataSource.deleteHabit(id);
  }

  @override
  Future<void> toggleTodayHabit(String id, DateTime date) async {
    final habit = await getHabitById(id);
    if (habit != null) {
      final updatedHabit = habit.toggleCompletion(date);
      await updateHabit(updatedHabit);
    }
  }
}
