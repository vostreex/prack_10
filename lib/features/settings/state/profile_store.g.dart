// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<User?>? _$currentUserComputed;

  @override
  User? get currentUser => (_$currentUserComputed ??= Computed<User?>(
    () => super.currentUser,
    name: '_ProfileStore.currentUser',
  )).value;
  Computed<String>? _$userNameComputed;

  @override
  String get userName => (_$userNameComputed ??= Computed<String>(
    () => super.userName,
    name: '_ProfileStore.userName',
  )).value;
  Computed<String>? _$userEmailComputed;

  @override
  String get userEmail => (_$userEmailComputed ??= Computed<String>(
    () => super.userEmail,
    name: '_ProfileStore.userEmail',
  )).value;
  Computed<String>? _$initialsComputed;

  @override
  String get initials => (_$initialsComputed ??= Computed<String>(
    () => super.initials,
    name: '_ProfileStore.initials',
  )).value;
  Computed<bool>? _$canSavePasswordComputed;

  @override
  bool get canSavePassword => (_$canSavePasswordComputed ??= Computed<bool>(
    () => super.canSavePassword,
    name: '_ProfileStore.canSavePassword',
  )).value;

  late final _$newPasswordAtom = Atom(
    name: '_ProfileStore.newPassword',
    context: context,
  );

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$confirmPasswordAtom = Atom(
    name: '_ProfileStore.confirmPassword',
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

  late final _$isPasswordVisibleAtom = Atom(
    name: '_ProfileStore.isPasswordVisible',
    context: context,
  );

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$_ProfileStoreActionController = ActionController(
    name: '_ProfileStore',
    context: context,
  );

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
      name: '_ProfileStore.setNewPassword',
    );
    try {
      return super.setNewPassword(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
      name: '_ProfileStore.setConfirmPassword',
    );
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
      name: '_ProfileStore.togglePasswordVisibility',
    );
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
      name: '_ProfileStore.changePassword',
    );
    try {
      return super.changePassword();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newPassword: ${newPassword},
confirmPassword: ${confirmPassword},
isPasswordVisible: ${isPasswordVisible},
currentUser: ${currentUser},
userName: ${userName},
userEmail: ${userEmail},
initials: ${initials},
canSavePassword: ${canSavePassword}
    ''';
  }
}
