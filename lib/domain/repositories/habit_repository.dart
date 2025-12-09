import 'package:prack_10/core/models/habit.dart';

abstract class HabitRepository {
  Future<List<Habit>> getAllHabits();
  Future<Habit?> getHabitById(String id);
  Future<void> addHabit(Habit habit);
  Future<void> updateHabit(Habit habit);
  Future<void> deleteHabit(String id);
  Future<void> toggleTodayHabit(String id, DateTime date);
}

