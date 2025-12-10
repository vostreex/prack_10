class HabitDto {
  final String id;
  final String title;
  final String icon;
  final int colorValue;
  final String completionsJson; // Map<DateTime, bool> сериализован в JSON
  final int createdAt;

  const HabitDto({
    required this.id,
    required this.title,
    required this.icon,
    required this.colorValue,
    required this.completionsJson,
    required this.createdAt,
  });

  factory HabitDto.fromMap(Map<String, dynamic> map) {
    return HabitDto(
      id: map['id'] as String,
      title: map['title'] as String,
      icon: map['icon'] as String,
      colorValue: map['colorValue'] as int,
      completionsJson: map['completionsJson'] as String? ?? '{}',
      createdAt: map['createdAt'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'colorValue': colorValue,
      'completionsJson': completionsJson,
      'createdAt': createdAt,
    };
  }
}
