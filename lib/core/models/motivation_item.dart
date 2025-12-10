import 'package:uuid/uuid.dart';

/// Модель элемента мотивации (цитата или факт)
class MotivationItem {
  final String id;
  final String text;
  final String category;
  final String type; // 'quote' или 'fact'

  MotivationItem({
    required this.text,
    required this.category,
    required this.type,
    String? id,
  }) : id = id ?? const Uuid().v4();

  MotivationItem copyWith({
    String? id,
    String? text,
    String? category,
    String? type,
  }) {
    return MotivationItem(
      id: id ?? this.id,
      text: text ?? this.text,
      category: category ?? this.category,
      type: type ?? this.type,
    );
  }
}
