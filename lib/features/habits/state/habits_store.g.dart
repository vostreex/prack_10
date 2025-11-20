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
  void addHabit(Habit habit) {
    final _$actionInfo = _$_HabitsStoreActionController.startAction(
      name: '_HabitsStore.addHabit',
    );
    try {
      return super.addHabit(habit);
    } finally {
      _$_HabitsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteHabit(String id) {
    final _$actionInfo = _$_HabitsStoreActionController.startAction(
      name: '_HabitsStore.deleteHabit',
    );
    try {
      return super.deleteHabit(id);
    } finally {
      _$_HabitsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleToday(String id) {
    final _$actionInfo = _$_HabitsStoreActionController.startAction(
      name: '_HabitsStore.toggleToday',
    );
    try {
      return super.toggleToday(id);
    } finally {
      _$_HabitsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
filteredHabits: ${filteredHabits}
    ''';
  }
}
