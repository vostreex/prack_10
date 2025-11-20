// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Habit on _Habit, Store {
  Computed<bool>? _$isDoneTodayComputed;

  @override
  bool get isDoneToday => (_$isDoneTodayComputed ??= Computed<bool>(
    () => super.isDoneToday,
    name: '_Habit.isDoneToday',
  )).value;
  Computed<int>? _$currentStreakComputed;

  @override
  int get currentStreak => (_$currentStreakComputed ??= Computed<int>(
    () => super.currentStreak,
    name: '_Habit.currentStreak',
  )).value;
  Computed<int>? _$bestStreakComputed;

  @override
  int get bestStreak => (_$bestStreakComputed ??= Computed<int>(
    () => super.bestStreak,
    name: '_Habit.bestStreak',
  )).value;
  Computed<int>? _$totalCompletedDaysComputed;

  @override
  int get totalCompletedDays => (_$totalCompletedDaysComputed ??= Computed<int>(
    () => super.totalCompletedDays,
    name: '_Habit.totalCompletedDays',
  )).value;

  late final _$idAtom = Atom(name: '_Habit.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$titleAtom = Atom(name: '_Habit.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$iconAtom = Atom(name: '_Habit.icon', context: context);

  @override
  String get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(String value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  late final _$colorAtom = Atom(name: '_Habit.color', context: context);

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$completionsAtom = Atom(
    name: '_Habit.completions',
    context: context,
  );

  @override
  ObservableMap<DateTime, bool> get completions {
    _$completionsAtom.reportRead();
    return super.completions;
  }

  @override
  set completions(ObservableMap<DateTime, bool> value) {
    _$completionsAtom.reportWrite(value, super.completions, () {
      super.completions = value;
    });
  }

  late final _$createdAtAtom = Atom(name: '_Habit.createdAt', context: context);

  @override
  DateTime get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(DateTime value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  late final _$_HabitActionController = ActionController(
    name: '_Habit',
    context: context,
  );

  @override
  void toggleToday() {
    final _$actionInfo = _$_HabitActionController.startAction(
      name: '_Habit.toggleToday',
    );
    try {
      return super.toggleToday();
    } finally {
      _$_HabitActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
icon: ${icon},
color: ${color},
completions: ${completions},
createdAt: ${createdAt},
isDoneToday: ${isDoneToday},
currentStreak: ${currentStreak},
bestStreak: ${bestStreak},
totalCompletedDays: ${totalCompletedDays}
    ''';
  }
}
