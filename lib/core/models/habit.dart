import 'package:uuid/uuid.dart';

class Habit {
  final String id;
  final String title;
  final String icon;
  final int colorValue; // Храним как int вместо Color
  final Map<DateTime, bool> completions;
  final DateTime createdAt;

  Habit({
    required this.title,
    required this.icon,
    required int colorValue,
    Map<DateTime, bool>? completions,
    DateTime? createdAt,
    String? id,
  })  : id = id ?? const Uuid().v4(),
        colorValue = colorValue,
        completions = Map.unmodifiable(completions ?? {}),
        createdAt = createdAt ?? DateTime.now();

  bool get isDoneToday {
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    return completions[todayKey] == true;
  }

  int get currentStreak {
    int streak = 0;
    DateTime current = DateTime.now();
    final todayKey = DateTime(current.year, current.month, current.day);

    // Если сегодня не выполнено, начинаем со вчера
    if (completions[todayKey] != true) {
      current = current.subtract(const Duration(days: 1));
    }

    while (true) {
      final key = DateTime(current.year, current.month, current.day);
      if (completions[key] == true) {
        streak++;
        current = current.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    return streak;
  }

  int get bestStreak {
    if (completions.isEmpty) return 0;

    int best = 0;
    int current = 0;
    final sortedDates = completions.keys.toList()..sort();

    for (var i = 0; i < sortedDates.length; i++) {
      if (completions[sortedDates[i]] == true) {
        current++;
        if (i == sortedDates.length - 1 || 
            sortedDates[i + 1].difference(sortedDates[i]).inDays > 1) {
          if (current > best) best = current;
          current = 0;
        }
      }
    }
    return best;
  }

  int get totalCompletedDays {
    return completions.values.where((done) => done == true).length;
  }

  Habit copyWith({
    String? id,
    String? title,
    String? icon,
    int? colorValue,
    Map<DateTime, bool>? completions,
    DateTime? createdAt,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      colorValue: colorValue ?? this.colorValue,
      completions: completions ?? this.completions,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Habit toggleCompletion(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final updatedCompletions = Map<DateTime, bool>.from(completions);
    if (updatedCompletions.containsKey(normalizedDate)) {
      updatedCompletions[normalizedDate] = !updatedCompletions[normalizedDate]!;
    } else {
      updatedCompletions[normalizedDate] = true;
    }
    return copyWith(completions: updatedCompletions);
  }
}
