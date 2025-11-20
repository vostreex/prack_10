// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesListStore on _NotesListStore, Store {
  Computed<List<Note>>? _$filteredNotesComputed;

  @override
  List<Note> get filteredNotes =>
      (_$filteredNotesComputed ??= Computed<List<Note>>(
        () => super.filteredNotes,
        name: '_NotesListStore.filteredNotes',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_NotesListStore.searchQuery',
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
    name: '_NotesListStore.selectedCategory',
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
    name: '_NotesListStore.sortCriteria',
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

  late final _$_NotesListStoreActionController = ActionController(
    name: '_NotesListStore',
    context: context,
  );

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortCriteria(String criteria) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.setSortCriteria',
    );
    try {
      return super.setSortCriteria(criteria);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNote(String id) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.deleteNote',
    );
    try {
      return super.deleteNote(id);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorite(String id) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.toggleFavorite',
    );
    try {
      return super.toggleFavorite(id);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleArchive(String id) {
    final _$actionInfo = _$_NotesListStoreActionController.startAction(
      name: '_NotesListStore.toggleArchive',
    );
    try {
      return super.toggleArchive(id);
    } finally {
      _$_NotesListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
sortCriteria: ${sortCriteria},
filteredNotes: ${filteredNotes}
    ''';
  }
}
