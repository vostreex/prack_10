// state/habit_details_store.dart
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/habit.dart';
part 'habit_details_store.g.dart';
class HabitDetailsStore = _HabitDetailsStore with _$HabitDetailsStore;
abstract class _HabitDetailsStore with Store {
  @observable
  Habit habit;
  final ObservableList<Habit> habits = GetIt.I<ObservableList<Habit>>();
  _HabitDetailsStore(this.habit);
  @action
  void toggleDate(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    habit.completions[key] = !(habit.completions[key] ?? false);
  }
  @action
  void deleteHabit(String id) => habits.removeWhere((h) => h.id == id);
}