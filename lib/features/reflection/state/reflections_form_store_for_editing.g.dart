// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflections_form_store_for_editing.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReflectionFormStoreEdit on _ReflectionFormStoreEdit, Store {
  late final _$answersAtom = Atom(
    name: '_ReflectionFormStoreEdit.answers',
    context: context,
  );

  @override
  ObservableList<String> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  bool _answersIsInitialized = false;

  @override
  set answers(ObservableList<String> value) {
    _$answersAtom.reportWrite(
      value,
      _answersIsInitialized ? super.answers : null,
      () {
        super.answers = value;
        _answersIsInitialized = true;
      },
    );
  }

  late final _$additionalNotesAtom = Atom(
    name: '_ReflectionFormStoreEdit.additionalNotes',
    context: context,
  );

  @override
  String get additionalNotes {
    _$additionalNotesAtom.reportRead();
    return super.additionalNotes;
  }

  bool _additionalNotesIsInitialized = false;

  @override
  set additionalNotes(String value) {
    _$additionalNotesAtom.reportWrite(
      value,
      _additionalNotesIsInitialized ? super.additionalNotes : null,
      () {
        super.additionalNotes = value;
        _additionalNotesIsInitialized = true;
      },
    );
  }

  late final _$_ReflectionFormStoreEditActionController = ActionController(
    name: '_ReflectionFormStoreEdit',
    context: context,
  );

  @override
  void setAnswer(int index, String value) {
    final _$actionInfo = _$_ReflectionFormStoreEditActionController.startAction(
      name: '_ReflectionFormStoreEdit.setAnswer',
    );
    try {
      return super.setAnswer(index, value);
    } finally {
      _$_ReflectionFormStoreEditActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAdditionalNotes(String value) {
    final _$actionInfo = _$_ReflectionFormStoreEditActionController.startAction(
      name: '_ReflectionFormStoreEdit.setAdditionalNotes',
    );
    try {
      return super.setAdditionalNotes(value);
    } finally {
      _$_ReflectionFormStoreEditActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_ReflectionFormStoreEditActionController.startAction(
      name: '_ReflectionFormStoreEdit.save',
    );
    try {
      return super.save();
    } finally {
      _$_ReflectionFormStoreEditActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
answers: ${answers},
additionalNotes: ${additionalNotes}
    ''';
  }
}
