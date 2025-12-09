// state/habits_store.dart
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/usecases/habits/get_habits_usecase.dart';
import 'package:prack_10/domain/usecases/habits/add_habit_usecase.dart';
import 'package:prack_10/domain/usecases/habits/delete_habit_usecase.dart';
import 'package:prack_10/domain/usecases/habits/toggle_today_habit_usecase.dart';
part 'habits_store.g.dart';
class HabitsStore = _HabitsStore with _$HabitsStore;
abstract class _HabitsStore with Store {
  final GetHabitsUseCase _getHabitsUseCase = GetIt.I<GetHabitsUseCase>();
  final AddHabitUseCase _addHabitUseCase = GetIt.I<AddHabitUseCase>();
  final DeleteHabitUseCase _deleteHabitUseCase = GetIt.I<DeleteHabitUseCase>();
  final ToggleTodayHabitUseCase _toggleTodayHabitUseCase = GetIt.I<ToggleTodayHabitUseCase>();

  @observable
  ObservableList<Habit> habits = ObservableList<Habit>();
  @observable
  String searchQuery = '';

  _HabitsStore() {
    _loadHabits();
  }

  @action
  Future<void> _loadHabits() async {
    final habitsList = await _getHabitsUseCase();
    habits = ObservableList<Habit>.of(habitsList);
  }

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
  Future<void> addHabit(Habit habit) async {
    await _addHabitUseCase(habit);
    await _loadHabits();
  }
  
  @action
  Future<void> deleteHabit(String id) async {
    await _deleteHabitUseCase(id);
    await _loadHabits();
  }
  
  @action
  Future<void> toggleToday(String id) async {
    await _toggleTodayHabitUseCase(id, DateTime.now());
    await _loadHabits();
  }

  @action
  Future<void> refreshHabits() async {
    await _loadHabits();
  }
}