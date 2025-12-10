// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditNoteStore on _EditNoteStore, Store {
  late final _$titleAtom = Atom(name: '_EditNoteStore.title', context: context);

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

  late final _$bodyAtom = Atom(name: '_EditNoteStore.body', context: context);

  @override
  String get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(String value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_EditNoteStore.selectedCategory',
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

  late final _$updateNoteAsyncAction = AsyncAction(
    '_EditNoteStore.updateNote',
    context: context,
  );

  @override
  Future<void> updateNote(String id, Note updatedNote) {
    return _$updateNoteAsyncAction.run(() => super.updateNote(id, updatedNote));
  }

  late final _$_EditNoteStoreActionController = ActionController(
    name: '_EditNoteStore',
    context: context,
  );

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
      name: '_EditNoteStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
      name: '_EditNoteStore.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBody(String value) {
    final _$actionInfo = _$_EditNoteStoreActionController.startAction(
      name: '_EditNoteStore.setBody',
    );
    try {
      return super.setBody(value);
    } finally {
      _$_EditNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
body: ${body},
selectedCategory: ${selectedCategory}
    ''';
  }
}
