// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<String>? _$languageComputed;

  @override
  String get language => (_$languageComputed ??= Computed<String>(
    () => super.language,
    name: '_SettingsStore.language',
  )).value;

  late final _$isDarkModeAtom = Atom(
    name: '_SettingsStore.isDarkMode',
    context: context,
  );

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$localeAtom = Atom(
    name: '_SettingsStore.locale',
    context: context,
  );

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$_SettingsStoreActionController = ActionController(
    name: '_SettingsStore',
    context: context,
  );

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
      name: '_SettingsStore.toggleDarkMode',
    );
    try {
      return super.toggleDarkMode();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLanguage(String langCode) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
      name: '_SettingsStore.setLanguage',
    );
    try {
      return super.setLanguage(langCode);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLanguage() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
      name: '_SettingsStore.toggleLanguage',
    );
    try {
      return super.toggleLanguage();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
locale: ${locale},
language: ${language}
    ''';
  }
}
