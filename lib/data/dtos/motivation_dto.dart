class MotivationDto {
  final String id;
  final String text;
  final String category;
  final String type; // 'quote' или 'fact'

  const MotivationDto({
    required this.id,
    required this.text,
    required this.category,
    required this.type,
  });

  factory MotivationDto.fromMap(Map<String, dynamic> map) {
    return MotivationDto(
      id: map['id'] as String,
      text: map['text'] as String,
      category: map['category'] as String,
      type: map['type'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'category': category,
      'type': type,
    };
  }
}
