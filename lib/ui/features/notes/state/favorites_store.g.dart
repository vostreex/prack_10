// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  Computed<List<Note>>? _$filteredNotesComputed;

  @override
  List<Note> get filteredNotes =>
      (_$filteredNotesComputed ??= Computed<List<Note>>(
        () => super.filteredNotes,
        name: '_FavoritesStore.filteredNotes',
      )).value;

  late final _$notesAtom = Atom(
    name: '_FavoritesStore.notes',
    context: context,
  );

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_FavoritesStore.searchQuery',
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
    name: '_FavoritesStore.selectedCategory',
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
    name: '_FavoritesStore.sortCriteria',
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

  late final _$_loadNotesAsyncAction = AsyncAction(
    '_FavoritesStore._loadNotes',
    context: context,
  );

  @override
  Future<void> _loadNotes() {
    return _$_loadNotesAsyncAction.run(() => super._loadNotes());
  }

  late final _$deleteNoteAsyncAction = AsyncAction(
    '_FavoritesStore.deleteNote',
    context: context,
  );

  @override
  Future<void> deleteNote(String id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  late final _$toggleFavoriteAsyncAction = AsyncAction(
    '_FavoritesStore.toggleFavorite',
    context: context,
  );

  @override
  Future<void> toggleFavorite(String id) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(id));
  }

  late final _$toggleArchiveAsyncAction = AsyncAction(
    '_FavoritesStore.toggleArchive',
    context: context,
  );

  @override
  Future<void> toggleArchive(String id) {
    return _$toggleArchiveAsyncAction.run(() => super.toggleArchive(id));
  }

  late final _$refreshNotesAsyncAction = AsyncAction(
    '_FavoritesStore.refreshNotes',
    context: context,
  );

  @override
  Future<void> refreshNotes() {
    return _$refreshNotesAsyncAction.run(() => super.refreshNotes());
  }

  late final _$_FavoritesStoreActionController = ActionController(
    name: '_FavoritesStore',
    context: context,
  );

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
      name: '_FavoritesStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
      name: '_FavoritesStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortCriteria(String criteria) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
      name: '_FavoritesStore.setSortCriteria',
    );
    try {
      return super.setSortCriteria(criteria);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
searchQuery: ${searchQuery},
selectedCategory: ${selectedCategory},
sortCriteria: ${sortCriteria},
filteredNotes: ${filteredNotes}
    ''';
  }
}
