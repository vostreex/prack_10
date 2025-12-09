import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/task.dart';

class TaskLocalDataSource {
  List<Task> get tasks => GetIt.I<List<Task>>();
}
