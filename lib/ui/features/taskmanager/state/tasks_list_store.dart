import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/domain/usecases/tasks/get_tasks_usecase.dart';
import 'package:prack_10/domain/usecases/tasks/delete_task_usecase.dart';

part 'tasks_list_store.g.dart';

class TasksListStore = _TasksListStore with _$TasksListStore;

abstract class _TasksListStore with Store {
  final GetTasksUseCase _getTasksUseCase = GetIt.I<GetTasksUseCase>();
  final DeleteTaskUseCase _deleteTaskUseCase = GetIt.I<DeleteTaskUseCase>();

  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @observable
  String searchQuery = '';

  @observable
  String selectedCategory = 'Все категории';

  @observable
  String sortCriteria = 'Дедлайн';

  _TasksListStore() {
    _loadTasks();
  }

  @action
  Future<void> _loadTasks() async {
    final tasksList = await _getTasksUseCase();
    tasks = ObservableList<Task>.of(tasksList);
  }

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  void setSelectedCategory(String value) => selectedCategory = value;

  @action
  void setSortCriteria(String value) => sortCriteria = value;

  @action
  Future<void> deleteTask(String id) async {
    await _deleteTaskUseCase(id);
    await _loadTasks();
  }

  @action
  Future<void> refreshTasks() async {
    await _loadTasks();
  }

  @computed
  List<Task> get filteredTasks {
    var filtered = tasks.toList();

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where((t) =>
      t.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          t.description.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    if (selectedCategory != 'Все категории') {
      filtered =
          filtered.where((t) => t.category == selectedCategory).toList();
    }

    if (sortCriteria == 'Дедлайн') {
      filtered.sort((a, b) => a.deadline.compareTo(b.deadline));
    } else {
      filtered.sort((a, b) => a.title.compareTo(b.title));
    }

    return filtered;
  }
}