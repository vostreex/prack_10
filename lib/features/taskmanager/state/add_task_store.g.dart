// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddTaskStore on _AddTaskStore, Store {
  late final _$titleAtom = Atom(name: '_AddTaskStore.title', context: context);

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
    name: '_AddTaskStore.description',
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

  late final _$selectedCategoryAtom = Atom(
    name: '_AddTaskStore.selectedCategory',
    context: context,
  );

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$deadlineAtom = Atom(
    name: '_AddTaskStore.deadline',
    context: context,
  );

  @override
  DateTime? get deadline {
    _$deadlineAtom.reportRead();
    return super.deadline;
  }

  @override
  set deadline(DateTime? value) {
    _$deadlineAtom.reportWrite(value, super.deadline, () {
      super.deadline = value;
    });
  }

  late final _$newItemsAtom = Atom(
    name: '_AddTaskStore.newItems',
    context: context,
  );

  @override
  ObservableList<String> get newItems {
    _$newItemsAtom.reportRead();
    return super.newItems;
  }

  @override
  set newItems(ObservableList<String> value) {
    _$newItemsAtom.reportWrite(value, super.newItems, () {
      super.newItems = value;
    });
  }

  late final _$newItemTitleAtom = Atom(
    name: '_AddTaskStore.newItemTitle',
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

  late final _$_AddTaskStoreActionController = ActionController(
    name: '_AddTaskStore',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.setDescription',
    );
    try {
      return super.setDescription(value);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeadline(DateTime value) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.setDeadline',
    );
    try {
      return super.setDeadline(value);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewItemTitle(String value) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.setNewItemTitle',
    );
    try {
      return super.setNewItemTitle(value);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewItem() {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.addNewItem',
    );
    try {
      return super.addNewItem();
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNewItem(String item) {
    final _$actionInfo = _$_AddTaskStoreActionController.startAction(
      name: '_AddTaskStore.removeNewItem',
    );
    try {
      return super.removeNewItem(item);
    } finally {
      _$_AddTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
selectedCategory: ${selectedCategory},
deadline: ${deadline},
newItems: ${newItems},
newItemTitle: ${newItemTitle}
    ''';
  }
}
