// state/add_habit_store.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/usecases/habits/add_habit_usecase.dart';
part 'add_habit_store.g.dart';
class AddHabitStore = _AddHabitStore with _$AddHabitStore;
abstract class _AddHabitStore with Store {
  final AddHabitUseCase _addHabitUseCase = GetIt.I<AddHabitUseCase>();
  @observable
  String title = '';
  @observable
  String selectedEmoji = '🔥';
  @observable
  Color selectedColor = Colors.orange;
  final List<String> availableEmojis = [
    '🔥', '💧', '📖', '🏃', '🧘‍♂️', '😴', '🍎',
    '🧠', '❤️', '⭐', '🎯', '☀️', '🌙',
    '🍃', '🌸', '🎵', '🎨', '📷', '💻',
    '🗣️', '🚲', '☕', '🧘‍♀️', '🚶', '🏋️',
  ];
  final List<Color> availableColors = [
    Colors.orange, Colors.red, Colors.purple, Colors.blue,
    Colors.green, Colors.teal, Colors.pink, Colors.amber,
    Colors.indigo, Colors.cyan, Colors.brown, Colors.deepOrange,
  ];
  @action
  Future<void> addHabit(Habit habit) async {
    await _addHabitUseCase(habit);
  }
  @action
  void setTitle(String value) => title = value;
  @action
  void setEmoji(String emoji) => selectedEmoji = emoji;
  @action
  void setColor(Color color) => selectedColor = color;
  @computed
  bool get canCreate => title.trim().isNotEmpty;
}