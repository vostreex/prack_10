// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Note on _Note, Store {
  late final _$idAtom = Atom(name: '_Note.id', context: context);

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

  late final _$titleAtom = Atom(name: '_Note.title', context: context);

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

  late final _$contentAtom = Atom(name: '_Note.content', context: context);

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$categoryAtom = Atom(name: '_Note.category', context: context);

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

  late final _$creationDateAtom = Atom(
    name: '_Note.creationDate',
    context: context,
  );

  @override
  DateTime get creationDate {
    _$creationDateAtom.reportRead();
    return super.creationDate;
  }

  @override
  set creationDate(DateTime value) {
    _$creationDateAtom.reportWrite(value, super.creationDate, () {
      super.creationDate = value;
    });
  }

  late final _$isFavoriteAtom = Atom(
    name: '_Note.isFavorite',
    context: context,
  );

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$isArchivedAtom = Atom(
    name: '_Note.isArchived',
    context: context,
  );

  @override
  bool get isArchived {
    _$isArchivedAtom.reportRead();
    return super.isArchived;
  }

  @override
  set isArchived(bool value) {
    _$isArchivedAtom.reportWrite(value, super.isArchived, () {
      super.isArchived = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
content: ${content},
category: ${category},
creationDate: ${creationDate},
isFavorite: ${isFavorite},
isArchived: ${isArchived}
    ''';
  }
}
