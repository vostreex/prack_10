import 'package:uuid/uuid.dart';

class Note {
  final String id;
  final String title;
  final String content;
  final String category;
  final DateTime creationDate;
  final bool isFavorite;
  final bool isArchived;

  Note({
    required this.title,
    required this.content,
    this.category = 'Без категории',
    String? id,
    DateTime? creationDate,
    this.isFavorite = false,
    this.isArchived = false,
  })  : id = id ?? const Uuid().v4(),
        creationDate = creationDate ?? DateTime.now();

  Note copyWith({
    String? id,
    String? title,
    String? content,
    String? category,
    DateTime? creationDate,
    bool? isFavorite,
    bool? isArchived,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      creationDate: creationDate ?? this.creationDate,
      isFavorite: isFavorite ?? this.isFavorite,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
