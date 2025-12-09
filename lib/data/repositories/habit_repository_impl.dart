import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';
import 'package:prack_10/data/datasources/habit_local_datasource.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource _dataSource;

  HabitRepositoryImpl(this._dataSource);

  @override
  Future<List<Habit>> getAllHabits() async {
    return _dataSource.habits.toList();
  }

  @override
  Future<Habit?> getHabitById(String id) async {
    try {
      return _dataSource.habits.firstWhere((habit) => habit.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addHabit(Habit habit) async {
    _dataSource.habits.add(habit);
  }

  @override
  Future<void> updateHabit(Habit habit) async {
    final index = _dataSource.habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      _dataSource.habits[index] = habit;
    }
  }

  @override
  Future<void> deleteHabit(String id) async {
    _dataSource.habits.removeWhere((habit) => habit.id == id);
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

