import 'package:prack_10/domain/repositories/settings_repository.dart';

class UpdateThemeUseCase {
  final SettingsRepository _repository;

  UpdateThemeUseCase(this._repository);

  Future<void> call(bool isDarkMode) async {
    await _repository.updateTheme(isDarkMode);
  }
}

