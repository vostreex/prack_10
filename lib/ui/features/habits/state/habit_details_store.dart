// state/habit_details_store.dart
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/domain/usecases/habits/update_habit_usecase.dart';
import 'package:prack_10/domain/usecases/habits/get_habit_by_id_usecase.dart';
import 'package:prack_10/domain/usecases/habits/delete_habit_usecase.dart';
part 'habit_details_store.g.dart';
class HabitDetailsStore = _HabitDetailsStore with _$HabitDetailsStore;
abstract class _HabitDetailsStore with Store {
  final UpdateHabitUseCase _updateHabitUseCase = GetIt.I<UpdateHabitUseCase>();
  final GetHabitByIdUseCase _getHabitByIdUseCase = GetIt.I<GetHabitByIdUseCase>();
  final DeleteHabitUseCase _deleteHabitUseCase = GetIt.I<DeleteHabitUseCase>();

  @observable
  Habit habit;

  _HabitDetailsStore(this.habit);

  @action
  Future<void> toggleDate(DateTime date) async {
    habit = habit.toggleCompletion(date);
    await _updateHabitUseCase(habit);
    final updatedHabit = await _getHabitByIdUseCase(habit.id);
    if (updatedHabit != null) {
      habit = updatedHabit;
    }
  }

  @action
  Future<void> deleteHabit(String id) async {
    await _deleteHabitUseCase(id);
  }
}