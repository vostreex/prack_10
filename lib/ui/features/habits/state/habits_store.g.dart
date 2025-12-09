// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HabitsStore on _HabitsStore, Store {
  Computed<List<Habit>>? _$filteredHabitsComputed;

  @override
  List<Habit> get filteredHabits =>
      (_$filteredHabitsComputed ??= Computed<List<Habit>>(
        () => super.filteredHabits,
        name: '_HabitsStore.filteredHabits',
      )).value;

  late final _$habitsAtom = Atom(name: '_HabitsStore.habits', context: context);

  @override
  ObservableList<Habit> get habits {
    _$habitsAtom.reportRead();
    return super.habits;
  }

  @override
  set habits(ObservableList<Habit> value) {
    _$habitsAtom.reportWrite(value, super.habits, () {
      super.habits = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_HabitsStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$_loadHabitsAsyncAction = AsyncAction(
    '_HabitsStore._loadHabits',
    context: context,
  );

  @override
  Future<void> _loadHabits() {
    return _$_loadHabitsAsyncAction.run(() => super._loadHabits());
  }

  late final _$addHabitAsyncAction = AsyncAction(
    '_HabitsStore.addHabit',
    context: context,
  );

  @override
  Future<void> addHabit(Habit habit) {
    return _$addHabitAsyncAction.run(() => super.addHabit(habit));
  }

  late final _$deleteHabitAsyncAction = AsyncAction(
    '_HabitsStore.deleteHabit',
    context: context,
  );

  @override
  Future<void> deleteHabit(String id) {
    return _$deleteHabitAsyncAction.run(() => super.deleteHabit(id));
  }

  late final _$toggleTodayAsyncAction = AsyncAction(
    '_HabitsStore.toggleToday',
    context: context,
  );

  @override
  Future<void> toggleToday(String id) {
    return _$toggleTodayAsyncAction.run(() => super.toggleToday(id));
  }

  late final _$refreshHabitsAsyncAction = AsyncAction(
    '_HabitsStore.refreshHabits',
    context: context,
  );

  @override
  Future<void> refreshHabits() {
    return _$refreshHabitsAsyncAction.run(() => super.refreshHabits());
  }

  late final _$_HabitsStoreActionController = ActionController(
    name: '_HabitsStore',
    context: context,
  );

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_HabitsStoreActionController.startAction(
      name: '_HabitsStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_HabitsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
habits: ${habits},
searchQuery: ${searchQuery},
filteredHabits: ${filteredHabits}
    ''';
  }
}
