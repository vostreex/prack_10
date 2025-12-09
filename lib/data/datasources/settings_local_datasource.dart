import 'package:prack_10/core/models/app_settings.dart';

class SettingsLocalDataSource {
  AppSettings _settings = const AppSettings(
    isDarkMode: false,
    languageCode: 'ru',
  );

  AppSettings getSettings() {
    return _settings;
  }

  void saveSettings(AppSettings settings) {
    _settings = settings;
  }

  void updateTheme(bool isDarkMode) {
    _settings = _settings.copyWith(isDarkMode: isDarkMode);
  }

  void updateLanguage(String languageCode) {
    _settings = _settings.copyWith(languageCode: languageCode);
  }
}

