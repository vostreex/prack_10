// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on _Task, Store {
  Computed<int>? _$progressPercentComputed;

  @override
  int get progressPercent => (_$progressPercentComputed ??= Computed<int>(
    () => super.progressPercent,
    name: '_Task.progressPercent',
  )).value;
  Computed<bool>? _$isCompletedComputed;

  @override
  bool get isCompleted => (_$isCompletedComputed ??= Computed<bool>(
    () => super.isCompleted,
    name: '_Task.isCompleted',
  )).value;

  late final _$idAtom = Atom(name: '_Task.id', context: context);

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

  late final _$titleAtom = Atom(name: '_Task.title', context: context);

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

  late final _$descriptionAtom = Atom(
    name: '_Task.description',
    context: context,
  );

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$itemsAtom = Atom(name: '_Task.items', context: context);

  @override
  ObservableList<TaskItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<TaskItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$categoryAtom = Atom(name: '_Task.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$deadlineAtom = Atom(name: '_Task.deadline', context: context);

  @override
  DateTime get deadline {
    _$deadlineAtom.reportRead();
    return super.deadline;
  }

  @override
  set deadline(DateTime value) {
    _$deadlineAtom.reportWrite(value, super.deadline, () {
      super.deadline = value;
    });
  }

  late final _$_TaskActionController = ActionController(
    name: '_Task',
    context: context,
  );

  @override
  void toggleItem(TaskItem item) {
    final _$actionInfo = _$_TaskActionController.startAction(
      name: '_Task.toggleItem',
    );
    try {
      return super.toggleItem(item);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(String title) {
    final _$actionInfo = _$_TaskActionController.startAction(
      name: '_Task.addItem',
    );
    try {
      return super.addItem(title);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(TaskItem item) {
    final _$actionInfo = _$_TaskActionController.startAction(
      name: '_Task.removeItem',
    );
    try {
      return super.removeItem(item);
    } finally {
      _$_TaskActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description},
items: ${items},
category: ${category},
deadline: ${deadline},
progressPercent: ${progressPercent},
isCompleted: ${isCompleted}
    ''';
  }
}
