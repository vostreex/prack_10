// models/habit.dart
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'habit.g.dart';
class Habit = _Habit with _$Habit;
abstract class _Habit with Store {
  @observable
  String id;
  @observable
  String title;
  @observable
  String icon; // emoji или Material icon name
  @observable
  Color color;
  @observable
  ObservableMap<DateTime, bool> completions = ObservableMap<DateTime, bool>();
  @observable
  DateTime createdAt;
  _Habit({
    required this.title,
    required this.icon,
    required this.color,
    String? id,
    Map<DateTime, bool>? completions,
  }) : id = id ?? const Uuid().v4(),
        createdAt = DateTime.now() {
    if (completions != null) {
      this.completions = ObservableMap.of(completions);
    }
  }
  @computed
  bool get isDoneToday {
    final today = DateTime.now();
    final key = DateTime(today.year, today.month, today.day);
    return completions[key] == true;
  }
  @computed
  int get currentStreak {
    int streak = 0;
    DateTime date = DateTime.now();
    while (true) {
      final key = DateTime(date.year, date.month, date.day);
      if (completions[key] == true) {
        streak++;
        date = date.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    return streak;
  }
  @computed
  int get bestStreak {
    int best = 0;
    int current = 0;
    DateTime date = DateTime(createdAt.year, createdAt.month, createdAt.day);
    final now = DateTime.now();
    final end = DateTime(now.year, now.month, now.day);
    while (!date.isAfter(end)) {
      final key = DateTime(date.year, date.month, date.day);
      if (completions[key] == true) {
        current++;
        if (current > best) best = current;
      } else {
        current = 0;
      }
      date = date.add(const Duration(days: 1));
    }
    return best;
  }
  @computed
  int get totalCompletedDays => completions.values.where((done) => done).length;
  @action
  void toggleToday() {
    final today = DateTime.now();
    final key = DateTime(today.year, today.month, today.day);
    completions[key] = !(completions[key] ?? false);
  }
}