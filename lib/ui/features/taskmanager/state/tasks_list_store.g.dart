// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksListStore on _TasksListStore, Store {
  Computed<List<Task>>? _$filteredTasksComputed;

  @override
  List<Task> get filteredTasks =>
      (_$filteredTasksComputed ??= Computed<List<Task>>(
        () => super.filteredTasks,
        name: '_TasksListStore.filteredTasks',
      )).value;

  late final _$tasksAtom = Atom(
    name: '_TasksListStore.tasks',
    context: context,
  );

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_TasksListStore.searchQuery',
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

  late final _$selectedCategoryAtom = Atom(
    name: '_TasksListStore.selectedCategory',
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

  late final _$sortCriteriaAtom = Atom(
    name: '_TasksListStore.sortCriteria',
    context: context,
  );

  @override
  String get sortCriteria {
    _$sortCriteriaAtom.reportRead();
    return super.sortCriteria;
  }

  @override
  set sortCriteria(String value) {
    _$sortCriteriaAtom.reportWrite(value, super.sortCriteria, () {
      super.sortCriteria = value;
    });
  }

  late final _$_loadTasksAsyncAction = AsyncAction(
    '_TasksListStore._loadTasks',
    context: context,
  );

  @override
  Future<void> _loadTasks() {
    return _$_loadTasksAsyncAction.run(() => super._loadTasks());
  }

  late final _$deleteTaskAsyncAction = AsyncAction(
    '_TasksListStore.deleteTask',
    context: context,
  );

  @override
  Future<void> deleteTask(String id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$refreshTasksAsyncAction = AsyncAction(
    '_TasksListStore.refreshTasks',
    context: context,
  );

  @override
  Future<void> refreshTasks() {
    return _$refreshTasksAsyncAction.run(() => super.refreshTasks());
  }

  late final _$_TasksListStoreActionController = ActionController(
    name: '_TasksListStore',
    context: context,
  );

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_TasksListStoreActionController.startAction(
      name: '_TasksListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_TasksListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String value) {
    final _$actionInfo = _$_TasksListStoreActionController.startAction(
      name: '_TasksListStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$_TasksListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortCriteria(String value) {
    final _$actionInfo = _$_TasksListStoreActionController.startAction(
      name: '_TasksListStore.setSortCriteria',
    );
    try {
      return super.setSortCriteria(value);
    } finally {
      _$_TasksListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
sortCriteria: ${sortCriteria},
filteredTasks: ${filteredTasks}
    ''';
  }
}
