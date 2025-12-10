class ReflectionDto {
  final String id;
  final int creationDate;
  final String answersJson; // List<String> сериализован в JSON
  final String additionalNotes;

  const ReflectionDto({
    required this.id,
    required this.creationDate,
    required this.answersJson,
    required this.additionalNotes,
  });

  factory ReflectionDto.fromMap(Map<String, dynamic> map) {
    return ReflectionDto(
      id: map['id'] as String,
      creationDate: map['creationDate'] as int,
      answersJson: map['answersJson'] as String? ?? '[]',
      additionalNotes: map['additionalNotes'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creationDate': creationDate,
      'answersJson': answersJson,
      'additionalNotes': additionalNotes,
    };
  }
}
