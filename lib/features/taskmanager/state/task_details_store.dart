// state/task_details_store.dart
import 'package:mobx/mobx.dart';
import '../models/task.dart';
import '../models/task_item.dart';

part 'task_details_store.g.dart';

class TaskDetailsStore = _TaskDetailsStore with _$TaskDetailsStore;

abstract class _TaskDetailsStore with Store {
  @observable
  Task task;

  @observable
  String newItemTitle = '';

  _TaskDetailsStore(this.task);

  @action
  void setNewItemTitle(String value) => newItemTitle = value;

  @action
  void addItem() {
    if (newItemTitle.trim().isNotEmpty) {
      task.addItem(newItemTitle.trim());
      newItemTitle = '';
    }
  }

  @action
  void toggleItem(TaskItem item) => task.toggleItem(item);

  @action
  void removeItem(TaskItem item) => task.removeItem(item);

  @computed
  bool get canAddItem => newItemTitle.trim().isNotEmpty;
}