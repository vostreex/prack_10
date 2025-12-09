import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/core/models/task_item.dart';
import 'package:prack_10/domain/usecases/tasks/update_task_usecase.dart';
import 'package:prack_10/domain/usecases/tasks/get_task_by_id_usecase.dart';

part 'task_details_store.g.dart';

class TaskDetailsStore = _TaskDetailsStore with _$TaskDetailsStore;

abstract class _TaskDetailsStore with Store {
  final UpdateTaskUseCase _updateTaskUseCase = GetIt.I<UpdateTaskUseCase>();
  final GetTaskByIdUseCase _getTaskByIdUseCase = GetIt.I<GetTaskByIdUseCase>();

  @observable
  Task task;

  @observable
  String newItemTitle = '';

  _TaskDetailsStore(this.task);

  @action
  void setNewItemTitle(String value) => newItemTitle = value;

  @action
  Future<void> addItem() async {
    if (newItemTitle.trim().isNotEmpty) {
      task = task.addItem(TaskItem(title: newItemTitle.trim()));
      await _updateTaskUseCase(task);
      final updatedTask = await _getTaskByIdUseCase(task.id);
      if (updatedTask != null) {
        task = updatedTask;
      }
      newItemTitle = '';
    }
  }

  @action
  Future<void> toggleItem(TaskItem item) async {
    task = task.toggleItem(item.id);
    await _updateTaskUseCase(task);
    final updatedTask = await _getTaskByIdUseCase(task.id);
    if (updatedTask != null) {
      task = updatedTask;
    }
  }

  @action
  Future<void> removeItem(TaskItem item) async {
    task = task.removeItem(item.id);
    await _updateTaskUseCase(task);
    final updatedTask = await _getTaskByIdUseCase(task.id);
    if (updatedTask != null) {
      task = updatedTask;
    }
  }

  @computed
  bool get canAddItem => newItemTitle.trim().isNotEmpty;
}