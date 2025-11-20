// state/habits_store.dart
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/habit.dart';
part 'habits_store.g.dart';
class HabitsStore = _HabitsStore with _$HabitsStore;
abstract class _HabitsStore with Store {
  final ObservableList<Habit> habits = GetIt.I<ObservableList<Habit>>();
  @observable
  String searchQuery = '';
  @action
  void setSearchQuery(String query) {
    searchQuery = query.toLowerCase();
  }
  @computed
  List<Habit> get filteredHabits {
    if (searchQuery.isEmpty) {
      return habits.toList();
    }
    return habits.where((habit) => habit.title.toLowerCase().contains(searchQuery)).toList();
  }
  @action
  void addHabit(Habit habit) => habits.add(habit);
  @action
  void deleteHabit(String id) => habits.removeWhere((h) => h.id == id);
  @action
  void toggleToday(String id) {
    final habit = habits.firstWhere((h) => h.id == id);
    habit.toggleToday();
  }
}