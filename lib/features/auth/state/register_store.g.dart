// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  Computed<bool>? _$passwordsMatchComputed;

  @override
  bool get passwordsMatch => (_$passwordsMatchComputed ??= Computed<bool>(
    () => super.passwordsMatch,
    name: '_RegisterStore.passwordsMatch',
  )).value;
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit => (_$canSubmitComputed ??= Computed<bool>(
    () => super.canSubmit,
    name: '_RegisterStore.canSubmit',
  )).value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??= Computed<bool>(
    () => super.hasError,
    name: '_RegisterStore.hasError',
  )).value;

  late final _$nameAtom = Atom(name: '_RegisterStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_RegisterStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_RegisterStore.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom = Atom(
    name: '_RegisterStore.confirmPassword',
    context: context,
  );

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_RegisterStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_RegisterStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$registerAsyncAction = AsyncAction(
    '_RegisterStore.register',
    context: context,
  );

  @override
  Future<bool> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$_RegisterStoreActionController = ActionController(
    name: '_RegisterStore',
    context: context,
  );

  @override
  void setName(String v) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
      name: '_RegisterStore.setName',
    );
    try {
      return super.setName(v);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String v) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
      name: '_RegisterStore.setEmail',
    );
    try {
      return super.setEmail(v);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String v) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
      name: '_RegisterStore.setPassword',
    );
    try {
      return super.setPassword(v);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String v) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
      name: '_RegisterStore.setConfirmPassword',
    );
    try {
      return super.setConfirmPassword(v);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
passwordsMatch: ${passwordsMatch},
canSubmit: ${canSubmit},
hasError: ${hasError}
    ''';
  }
}
