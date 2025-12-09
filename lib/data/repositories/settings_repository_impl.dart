import 'package:prack_10/core/models/app_settings.dart';
import 'package:prack_10/domain/repositories/settings_repository.dart';
import 'package:prack_10/data/datasources/settings_local_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<AppSettings> getSettings() async {
    return _dataSource.getSettings();
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    _dataSource.saveSettings(settings);
  }

  @override
  Future<void> updateTheme(bool isDarkMode) async {
    _dataSource.updateTheme(isDarkMode);
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    if (languageCode != 'ru' && languageCode != 'en') {
      throw Exception('Неподдерживаемый язык');
    }
    _dataSource.updateLanguage(languageCode);
  }
}

