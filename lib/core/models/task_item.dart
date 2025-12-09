import 'package:uuid/uuid.dart';

class TaskItem {
  final String id;
  final String title;
  final bool isCompleted;

  TaskItem({
    required this.title,
    this.isCompleted = false,
    String? id,
  }) : id = id ?? const Uuid().v4();

  TaskItem copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
