// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNoteStore on _AddNoteStore, Store {
  late final _$titleAtom = Atom(name: '_AddNoteStore.title', context: context);

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

  late final _$bodyAtom = Atom(name: '_AddNoteStore.body', context: context);

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
    name: '_AddNoteStore.selectedCategory',
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

  late final _$_AddNoteStoreActionController = ActionController(
    name: '_AddNoteStore',
    context: context,
  );

  @override
  void addNote(Note note) {
    final _$actionInfo = _$_AddNoteStoreActionController.startAction(
      name: '_AddNoteStore.addNote',
    );
    try {
      return super.addNote(note);
    } finally {
      _$_AddNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_AddNoteStoreActionController.startAction(
      name: '_AddNoteStore.setSelectedCategory',
    );
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_AddNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String title) {
    final _$actionInfo = _$_AddNoteStoreActionController.startAction(
      name: '_AddNoteStore.setTitle',
    );
    try {
      return super.setTitle(title);
    } finally {
      _$_AddNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBody(String body) {
    final _$actionInfo = _$_AddNoteStoreActionController.startAction(
      name: '_AddNoteStore.setBody',
    );
    try {
      return super.setBody(body);
    } finally {
      _$_AddNoteStoreActionController.endAction(_$actionInfo);
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
