// features/settings/state/settings_store.dart
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  @observable
  bool isDarkMode = false;

  @observable
  Locale locale = const Locale('ru');

  @computed
  String get language => locale.languageCode == 'en' ? 'English' : 'Русский';

  @action
  void toggleDarkMode() => isDarkMode = !isDarkMode;

  @action
  void setLanguage(String langCode) {
    locale = Locale(langCode);
  }

  @action
  void toggleLanguage() {
    locale = locale.languageCode == 'ru' ? const Locale('en') : const Locale('ru');
  }
}