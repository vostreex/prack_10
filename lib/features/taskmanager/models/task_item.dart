import 'package:mobx/mobx.dart';

part 'task_item.g.dart';

class TaskItem = _TaskItem with _$TaskItem;

abstract class _TaskItem with Store {
  @observable
  String title;

  @observable
  bool isDone;

  _TaskItem({required this.title, this.isDone = false});
}
