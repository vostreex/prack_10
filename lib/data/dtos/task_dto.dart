class TaskDto {
  final String id;
  final String title;
  final String description;
  final String category;
  final int deadline;
  final String itemsJson; // List<TaskItem> сериализован в JSON

  const TaskDto({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.deadline,
    required this.itemsJson,
  });

  factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      category: map['category'] as String? ?? 'Без категории',
      deadline: map['deadline'] as int,
      itemsJson: map['itemsJson'] as String? ?? '[]',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'deadline': deadline,
      'itemsJson': itemsJson,
    };
  }
}
