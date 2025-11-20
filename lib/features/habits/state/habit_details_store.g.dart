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

  late final _$_HabitDetailsStoreActionController = ActionController(
    name: '_HabitDetailsStore',
    context: context,
  );

  @override
  void toggleDate(DateTime date) {
    final _$actionInfo = _$_HabitDetailsStoreActionController.startAction(
      name: '_HabitDetailsStore.toggleDate',
    );
    try {
      return super.toggleDate(date);
    } finally {
      _$_HabitDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteHabit(String id) {
    final _$actionInfo = _$_HabitDetailsStoreActionController.startAction(
      name: '_HabitDetailsStore.deleteHabit',
    );
    try {
      return super.deleteHabit(id);
    } finally {
      _$_HabitDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
habit: ${habit}
    ''';
  }
}
