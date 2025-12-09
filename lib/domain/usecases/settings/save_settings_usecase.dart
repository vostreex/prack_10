import 'package:prack_10/core/models/app_settings.dart';
import 'package:prack_10/domain/repositories/settings_repository.dart';

class SaveSettingsUseCase {
  final SettingsRepository _repository;

  SaveSettingsUseCase(this._repository);

  Future<void> call(AppSettings settings) async {
    await _repository.saveSettings(settings);
  }
}

