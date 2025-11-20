// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflections_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReflectionsListStore on _ReflectionsListStore, Store {
  Computed<List<ReflectionEntry>>? _$filteredReflectionsComputed;

  @override
  List<ReflectionEntry> get filteredReflections =>
      (_$filteredReflectionsComputed ??= Computed<List<ReflectionEntry>>(
        () => super.filteredReflections,
        name: '_ReflectionsListStore.filteredReflections',
      )).value;

  late final _$searchQueryAtom = Atom(
    name: '_ReflectionsListStore.searchQuery',
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

  late final _$_ReflectionsListStoreActionController = ActionController(
    name: '_ReflectionsListStore',
    context: context,
  );

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_ReflectionsListStoreActionController.startAction(
      name: '_ReflectionsListStore.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_ReflectionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteReflection(String id) {
    final _$actionInfo = _$_ReflectionsListStoreActionController.startAction(
      name: '_ReflectionsListStore.deleteReflection',
    );
    try {
      return super.deleteReflection(id);
    } finally {
      _$_ReflectionsListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
filteredReflections: ${filteredReflections}
    ''';
  }
}
