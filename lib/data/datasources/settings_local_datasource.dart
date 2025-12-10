import 'package:shared_preferences/shared_preferences.dart';
import 'package:prack_10/core/models/app_settings.dart';

/// Data source для хранения настроек приложения через SharedPreferences
class SettingsLocalDataSource {
  static const String _keyIsDarkMode = 'isDarkMode';
  static const String _keyLanguageCode = 'languageCode';
  static const String _keyOnboardingCompleted = 'onboardingCompleted';

  /// Получить настройки из SharedPreferences
  Future<AppSettings> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    return AppSettings(
      isDarkMode: prefs.getBool(_keyIsDarkMode) ?? false,
      languageCode: prefs.getString(_keyLanguageCode) ?? 'ru',
      onboardingCompleted: prefs.getBool(_keyOnboardingCompleted) ?? false,
    );
  }

  /// Сохранить настройки в SharedPreferences
  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, settings.isDarkMode);
    await prefs.setString(_keyLanguageCode, settings.languageCode);
    await prefs.setBool(_keyOnboardingCompleted, settings.onboardingCompleted);
  }

  /// Обновить тему
  Future<void> updateTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, isDarkMode);
  }

  /// Обновить язык
  Future<void> updateLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguageCode, languageCode);
  }

  /// Установить флаг завершения onboarding
  Future<void> setOnboardingCompleted(bool completed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingCompleted, completed);
  }

  /// Получить флаг завершения onboarding
  Future<bool> getOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboardingCompleted) ?? false;
  }
}
