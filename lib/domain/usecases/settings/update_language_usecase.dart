import 'package:prack_10/domain/repositories/settings_repository.dart';

class UpdateLanguageUseCase {
  final SettingsRepository _repository;

  UpdateLanguageUseCase(this._repository);

  Future<void> call(String languageCode) async {
    if (languageCode.trim().isEmpty) {
      throw Exception('Код языка не может быть пустым');
    }
    if (languageCode != 'ru' && languageCode != 'en') {
      throw Exception('Неподдерживаемый язык. Доступны: ru, en');
    }
    await _repository.updateLanguage(languageCode);
  }
}

