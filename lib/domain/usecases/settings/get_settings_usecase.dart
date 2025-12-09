import 'package:prack_10/core/models/app_settings.dart';
import 'package:prack_10/domain/repositories/settings_repository.dart';

class GetSettingsUseCase {
  final SettingsRepository _repository;

  GetSettingsUseCase(this._repository);

  Future<AppSettings> call() async {
    return await _repository.getSettings();
  }
}

