// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection_entry.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReflectionEntry on _ReflectionEntry, Store {
  late final _$idAtom = Atom(name: '_ReflectionEntry.id', context: context);

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

  late final _$creationDateAtom = Atom(
    name: '_ReflectionEntry.creationDate',
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

  late final _$answersAtom = Atom(
    name: '_ReflectionEntry.answers',
    context: context,
  );

  @override
  ObservableList<String> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(ObservableList<String> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$additionalNotesAtom = Atom(
    name: '_ReflectionEntry.additionalNotes',
    context: context,
  );

  @override
  String get additionalNotes {
    _$additionalNotesAtom.reportRead();
    return super.additionalNotes;
  }

  @override
  set additionalNotes(String value) {
    _$additionalNotesAtom.reportWrite(value, super.additionalNotes, () {
      super.additionalNotes = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
creationDate: ${creationDate},
answers: ${answers},
additionalNotes: ${additionalNotes}
    ''';
  }
}
