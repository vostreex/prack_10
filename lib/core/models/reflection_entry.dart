import 'package:uuid/uuid.dart';

class ReflectionEntry {
  final String id;
  final DateTime creationDate;
  final List<String> answers;
  final String additionalNotes;

  ReflectionEntry({
    required List<String> answers,
    this.additionalNotes = '',
    String? id,
    DateTime? creationDate,
  })  : id = id ?? const Uuid().v4(),
        creationDate = creationDate ?? DateTime.now(),
        answers = List.unmodifiable(answers);

  ReflectionEntry copyWith({
    String? id,
    DateTime? creationDate,
    List<String>? answers,
    String? additionalNotes,
  }) {
    return ReflectionEntry(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      answers: answers ?? this.answers,
      additionalNotes: additionalNotes ?? this.additionalNotes,
    );
  }
}
