import 'package:uuid/uuid.dart';
import 'task_item.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final List<TaskItem> items;
  final String category;
  final DateTime deadline;

  Task({
    required this.title,
    this.description = '',
    required List<TaskItem> items,
    this.category = 'Без категории',
    required this.deadline,
    String? id,
  })  : id = id ?? const Uuid().v4(),
        items = List.unmodifiable(items);

  int get progressPercent {
    if (items.isEmpty) return 0;
    final completed = items.where((item) => item.isCompleted).length;
    return ((completed / items.length) * 100).round();
  }

  bool get isCompleted => items.isNotEmpty && items.every((item) => item.isCompleted);

  Task copyWith({
    String? id,
    String? title,
    String? description,
    List<TaskItem>? items,
    String? category,
    DateTime? deadline,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      items: items ?? this.items,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
    );
  }

  Task toggleItem(String itemId) {
    final updatedItems = items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(isCompleted: !item.isCompleted);
      }
      return item;
    }).toList();
    return copyWith(items: updatedItems);
  }

  Task addItem(TaskItem item) {
    final updatedItems = [...items, item];
    return copyWith(items: updatedItems);
  }

  Task removeItem(String itemId) {
    final updatedItems = items.where((item) => item.id != itemId).toList();
    return copyWith(items: updatedItems);
  }
}
