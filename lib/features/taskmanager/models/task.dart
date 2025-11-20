import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'task_item.dart';

part 'task.g.dart';

class Task = _Task with _$Task;

abstract class _Task with Store {
  @observable
  String id;

  @observable
  String title;

  @observable
  String description;

  @observable
  ObservableList<TaskItem> items = ObservableList<TaskItem>();

  @observable
  String category;

  @observable
  DateTime deadline;

  _Task({
    required this.title,
    this.description = '',
    required List<TaskItem> items,
    this.category = 'Без категории',
    DateTime? deadline,
    String? id,
  })  : id = id ?? const Uuid().v4(),
        deadline = deadline ?? DateTime.now() {
    this.items = ObservableList.of(items);
  }

  @computed
  int get progressPercent {
    if (items.isEmpty) return 0;
    final done = items.where((i) => i.isDone).length;
    return ((done / items.length) * 100).round();
  }

  @computed
  bool get isCompleted => progressPercent == 100;

  @action
  void toggleItem(TaskItem item) => item.isDone = !item.isDone;

  @action
  void addItem(String title) => items.add(TaskItem(title: title));

  @action
  void removeItem(TaskItem item) => items.remove(item);
}
