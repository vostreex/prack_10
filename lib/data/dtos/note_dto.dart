class NoteDto {
  final String id;
  final String title;
  final String content;
  final String category;
  final int creationDate;
  final int isFavorite;
  final int isArchived;

  const NoteDto({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.creationDate,
    required this.isFavorite,
    required this.isArchived,
  });

  // Для SQLite
  factory NoteDto.fromMap(Map<String, dynamic> map) {
    return NoteDto(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      category: map['category'],
      creationDate: map['creationDate'],
      isFavorite: map['isFavorite'],
      isArchived: map['isArchived'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'creationDate': creationDate,
      'isFavorite': isFavorite,
      'isArchived': isArchived,
    };
  }
}
