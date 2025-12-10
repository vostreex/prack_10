import 'dart:convert';
import '../../core/models/habit.dart';
import '../dtos/habit_dto.dart';

class HabitMapper {
  static Habit fromDto(HabitDto dto) {
    // Парсим completionsJson в Map<DateTime, bool>
    Map<DateTime, bool> completions = {};
    try {
      final Map<String, dynamic> json = jsonDecode(dto.completionsJson);
      json.forEach((key, value) {
        final dateTime = DateTime.parse(key);
        final normalizedDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
        completions[normalizedDate] = value as bool;
      });
    } catch (e) {
      completions = {};
    }

    return Habit(
      id: dto.id,
      title: dto.title,
      icon: dto.icon,
      colorValue: dto.colorValue,
      completions: completions,
      createdAt: DateTime.fromMillisecondsSinceEpoch(dto.createdAt),
    );
  }

  static HabitDto toDto(Habit entity) {
    // Сериализуем Map<DateTime, bool> в JSON
    final Map<String, dynamic> completionsMap = {};
    entity.completions.forEach((date, value) {
      completionsMap[date.toIso8601String()] = value;
    });
    final completionsJson = jsonEncode(completionsMap);

    return HabitDto(
      id: entity.id,
      title: entity.title,
      icon: entity.icon,
      colorValue: entity.colorValue,
      completionsJson: completionsJson,
      createdAt: entity.createdAt.millisecondsSinceEpoch,
    );
  }
}
