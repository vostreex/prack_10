// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDetailsStore on _TaskDetailsStore, Store {
  Computed<bool>? _$canAddItemComputed;

  @override
  bool get canAddItem => (_$canAddItemComputed ??= Computed<bool>(
    () => super.canAddItem,
    name: '_TaskDetailsStore.canAddItem',
  )).value;

  late final _$taskAtom = Atom(
    name: '_TaskDetailsStore.task',
    context: context,
  );

  @override
  Task get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$newItemTitleAtom = Atom(
    name: '_TaskDetailsStore.newItemTitle',
    context: context,
  );

  @override
  String get newItemTitle {
    _$newItemTitleAtom.reportRead();
    return super.newItemTitle;
  }

  @override
  set newItemTitle(String value) {
    _$newItemTitleAtom.reportWrite(value, super.newItemTitle, () {
      super.newItemTitle = value;
    });
  }

  late final _$_TaskDetailsStoreActionController = ActionController(
    name: '_TaskDetailsStore',
    context: context,
  );

  @override
  void setNewItemTitle(String value) {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
      name: '_TaskDetailsStore.setNewItemTitle',
    );
    try {
      return super.setNewItemTitle(value);
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem() {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
      name: '_TaskDetailsStore.addItem',
    );
    try {
      return super.addItem();
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleItem(TaskItem item) {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
      name: '_TaskDetailsStore.toggleItem',
    );
    try {
      return super.toggleItem(item);
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(TaskItem item) {
    final _$actionInfo = _$_TaskDetailsStoreActionController.startAction(
      name: '_TaskDetailsStore.removeItem',
    );
    try {
      return super.removeItem(item);
    } finally {
      _$_TaskDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
task: ${task},
newItemTitle: ${newItemTitle},
canAddItem: ${canAddItem}
    ''';
  }
}
