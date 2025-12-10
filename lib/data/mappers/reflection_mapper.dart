import 'dart:convert';
import '../../core/models/reflection_entry.dart';
import '../dtos/reflection_dto.dart';

class ReflectionMapper {
  static ReflectionEntry fromDto(ReflectionDto dto) {
    // Парсим answersJson в List<String>
    List<String> answers = [];
    try {
      final List<dynamic> jsonList = jsonDecode(dto.answersJson);
      answers = jsonList.map((item) => item as String).toList();
    } catch (e) {
      answers = [];
    }

    return ReflectionEntry(
      id: dto.id,
      creationDate: DateTime.fromMillisecondsSinceEpoch(dto.creationDate),
      answers: answers,
      additionalNotes: dto.additionalNotes,
    );
  }

  static ReflectionDto toDto(ReflectionEntry entity) {
    // Сериализуем List<String> в JSON
    final answersJson = jsonEncode(entity.answers);

    return ReflectionDto(
      id: entity.id,
      creationDate: entity.creationDate.millisecondsSinceEpoch,
      answersJson: answersJson,
      additionalNotes: entity.additionalNotes,
    );
  }
}
