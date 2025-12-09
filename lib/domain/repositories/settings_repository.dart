import 'package:prack_10/core/models/app_settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> getSettings();
  Future<void> saveSettings(AppSettings settings);
  Future<void> updateTheme(bool isDarkMode);
  Future<void> updateLanguage(String languageCode);
}

