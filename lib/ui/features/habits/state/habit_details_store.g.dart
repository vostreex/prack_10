// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HabitDetailsStore on _HabitDetailsStore, Store {
  late final _$habitAtom = Atom(
    name: '_HabitDetailsStore.habit',
    context: context,
  );

  @override
  Habit get habit {
    _$habitAtom.reportRead();
    return super.habit;
  }

  @override
  set habit(Habit value) {
    _$habitAtom.reportWrite(value, super.habit, () {
      super.habit = value;
    });
  }

  late final _$toggleDateAsyncAction = AsyncAction(
    '_HabitDetailsStore.toggleDate',
    context: context,
  );

  @override
  Future<void> toggleDate(DateTime date) {
    return _$toggleDateAsyncAction.run(() => super.toggleDate(date));
  }

  late final _$deleteHabitAsyncAction = AsyncAction(
    '_HabitDetailsStore.deleteHabit',
    context: context,
  );

  @override
  Future<void> deleteHabit(String id) {
    return _$deleteHabitAsyncAction.run(() => super.deleteHabit(id));
  }

  @override
  String toString() {
    return '''
habit: ${habit}
    ''';
  }
}
