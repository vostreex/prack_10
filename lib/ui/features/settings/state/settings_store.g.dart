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
  Computed<Locale>? _$localeComputed;

  @override
  Locale get locale => (_$localeComputed ??= Computed<Locale>(
    () => super.locale,
    name: '_SettingsStore.locale',
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

  late final _$languageCodeAtom = Atom(
    name: '_SettingsStore.languageCode',
    context: context,
  );

  @override
  String get languageCode {
    _$languageCodeAtom.reportRead();
    return super.languageCode;
  }

  @override
  set languageCode(String value) {
    _$languageCodeAtom.reportWrite(value, super.languageCode, () {
      super.languageCode = value;
    });
  }

  late final _$toggleDarkModeAsyncAction = AsyncAction(
    '_SettingsStore.toggleDarkMode',
    context: context,
  );

  @override
  Future<void> toggleDarkMode() {
    return _$toggleDarkModeAsyncAction.run(() => super.toggleDarkMode());
  }

  late final _$setLanguageAsyncAction = AsyncAction(
    '_SettingsStore.setLanguage',
    context: context,
  );

  @override
  Future<void> setLanguage(String langCode) {
    return _$setLanguageAsyncAction.run(() => super.setLanguage(langCode));
  }

  late final _$toggleLanguageAsyncAction = AsyncAction(
    '_SettingsStore.toggleLanguage',
    context: context,
  );

  @override
  Future<void> toggleLanguage() {
    return _$toggleLanguageAsyncAction.run(() => super.toggleLanguage());
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
languageCode: ${languageCode},
language: ${language},
locale: ${locale}
    ''';
  }
}
