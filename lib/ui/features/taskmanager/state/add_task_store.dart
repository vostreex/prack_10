import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/core/models/task_item.dart';
import 'package:prack_10/domain/usecases/tasks/add_task_usecase.dart';

part 'add_task_store.g.dart';

class AddTaskStore = _AddTaskStore with _$AddTaskStore;

abstract class _AddTaskStore with Store {
  final AddTaskUseCase _addTaskUseCase = GetIt.I<AddTaskUseCase>();
  @observable
  String title = '';

  @observable
  String description = '';

  @observable
  String selectedCategory = 'Без категории';

  @observable
  DateTime? deadline = DateTime.now();

  @observable
  ObservableList<String> newItems = ObservableList<String>();

  @observable
  String newItemTitle = '';

  @action
  void setTitle(String value) => title = value;

  @action
  void setDescription(String value) => description = value;

  @action
  void setSelectedCategory(String value) => selectedCategory = value;

  @action
  void setDeadline(DateTime value) => deadline = value;

  @action
  void setNewItemTitle(String value) => newItemTitle = value;

  @action
  void addNewItem() {
    if (newItemTitle.trim().isNotEmpty) {
      newItems.add(newItemTitle);
      newItemTitle = '';
    }
  }

  @action
  void removeNewItem(String item) => newItems.remove(item);

  @action
  Future<void> addTask() async {
    final task = Task(
      title: title,
      description: description,
      items: newItems.map((title) => TaskItem(title: title)).toList(),
      category: selectedCategory,
      deadline: deadline ?? DateTime.now(),
    );
    await _addTaskUseCase(task);
  }

  Task buildTask() {
    return Task(
      title: title,
      description: description,
      items: newItems.map((title) => TaskItem(title: title)).toList(),
      category: selectedCategory,
      deadline: deadline ?? DateTime.now(),
    );
  }
}