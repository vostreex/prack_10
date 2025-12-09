import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/habit.dart';

class HabitLocalDataSource {
  List<Habit> get habits => GetIt.I<List<Habit>>();
}
