// features/settings/state/settings_store.dart
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/domain/usecases/settings/get_settings_usecase.dart';
import 'package:prack_10/domain/usecases/settings/update_theme_usecase.dart';
import 'package:prack_10/domain/usecases/settings/update_language_usecase.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final GetSettingsUseCase _getSettingsUseCase = GetIt.I<GetSettingsUseCase>();
  final UpdateThemeUseCase _updateThemeUseCase = GetIt.I<UpdateThemeUseCase>();
  final UpdateLanguageUseCase _updateLanguageUseCase = GetIt.I<UpdateLanguageUseCase>();

  @observable
  bool isDarkMode = false;

  @observable
  String languageCode = 'ru';

  @computed
  String get language => languageCode == 'en' ? 'English' : 'Русский';

  @computed
  Locale get locale => Locale(languageCode);

  _SettingsStore();

  Future<void> init() async {
    final settings = await _getSettingsUseCase();
    isDarkMode = settings.isDarkMode;
    languageCode = settings.languageCode;
  }

  @action
  Future<void> toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    await _updateThemeUseCase(isDarkMode);
  }

  @action
  Future<void> setLanguage(String langCode) async {
    languageCode = langCode;
    await _updateLanguageUseCase(langCode);
  }

  @action
  Future<void> toggleLanguage() async {
    final newLang = languageCode == 'ru' ? 'en' : 'ru';
    await setLanguage(newLang);
  }
}