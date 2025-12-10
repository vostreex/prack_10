import 'dart:convert';
import '../../core/models/task.dart';
import '../../core/models/task_item.dart';
import '../dtos/task_dto.dart';

class TaskMapper {
  static Task fromDto(TaskDto dto) {
    // Парсим itemsJson в List<TaskItem>
    List<TaskItem> items = [];
    try {
      final List<dynamic> jsonList = jsonDecode(dto.itemsJson);
      items = jsonList.map((item) {
        return TaskItem(
          id: item['id'] as String?,
          title: item['title'] as String,
          isCompleted: item['isCompleted'] as bool? ?? false,
        );
      }).toList();
    } catch (e) {
      items = [];
    }

    return Task(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      category: dto.category,
      deadline: DateTime.fromMillisecondsSinceEpoch(dto.deadline),
      items: items,
    );
  }

  static TaskDto toDto(Task entity) {
    // Сериализуем List<TaskItem> в JSON
    final itemsList = entity.items.map((item) {
      return {
        'id': item.id,
        'title': item.title,
        'isCompleted': item.isCompleted,
      };
    }).toList();
    final itemsJson = jsonEncode(itemsList);

    return TaskDto(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      deadline: entity.deadline.millisecondsSinceEpoch,
      itemsJson: itemsJson,
    );
  }
}
