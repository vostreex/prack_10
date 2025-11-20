import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/task.dart';

part 'tasks_list_store.g.dart';

class TasksListStore = _TasksListStore with _$TasksListStore;

abstract class _TasksListStore with Store {
  final ObservableList<Task> tasks = GetIt.I<ObservableList<Task>>();

  @observable
  String searchQuery = '';

  @observable
  String selectedCategory = 'Все категории';

  @observable
  String sortCriteria = 'Дедлайн';

  @action
  void setSearchQuery(String value) => searchQuery = value;

  @action
  void setSelectedCategory(String value) => selectedCategory = value;

  @action
  void setSortCriteria(String value) => sortCriteria = value;

  @action
  void deleteTask(String id) => tasks.removeWhere((t) => t.id == id);

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