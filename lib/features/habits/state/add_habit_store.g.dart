// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_habit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddHabitStore on _AddHabitStore, Store {
  Computed<bool>? _$canCreateComputed;

  @override
  bool get canCreate => (_$canCreateComputed ??= Computed<bool>(
    () => super.canCreate,
    name: '_AddHabitStore.canCreate',
  )).value;

  late final _$titleAtom = Atom(name: '_AddHabitStore.title', context: context);

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

  late final _$selectedEmojiAtom = Atom(
    name: '_AddHabitStore.selectedEmoji',
    context: context,
  );

  @override
  String get selectedEmoji {
    _$selectedEmojiAtom.reportRead();
    return super.selectedEmoji;
  }

  @override
  set selectedEmoji(String value) {
    _$selectedEmojiAtom.reportWrite(value, super.selectedEmoji, () {
      super.selectedEmoji = value;
    });
  }

  late final _$selectedColorAtom = Atom(
    name: '_AddHabitStore.selectedColor',
    context: context,
  );

  @override
  Color get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(Color value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  late final _$_AddHabitStoreActionController = ActionController(
    name: '_AddHabitStore',
    context: context,
  );

  @override
  void addHabit(Habit habit) {
    final _$actionInfo = _$_AddHabitStoreActionController.startAction(
      name: '_AddHabitStore.addHabit',
    );
    try {
      return super.addHabit(habit);
    } finally {
      _$_AddHabitStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AddHabitStoreActionController.startAction(
      name: '_AddHabitStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_AddHabitStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmoji(String emoji) {
    final _$actionInfo = _$_AddHabitStoreActionController.startAction(
      name: '_AddHabitStore.setEmoji',
    );
    try {
      return super.setEmoji(emoji);
    } finally {
      _$_AddHabitStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color color) {
    final _$actionInfo = _$_AddHabitStoreActionController.startAction(
      name: '_AddHabitStore.setColor',
    );
    try {
      return super.setColor(color);
    } finally {
      _$_AddHabitStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
selectedEmoji: ${selectedEmoji},
selectedColor: ${selectedColor},
canCreate: ${canCreate}
    ''';
  }
}
