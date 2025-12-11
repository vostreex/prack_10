// features/auth/presentation/state/register_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable String name = '';
  @observable String email = '';
  @observable String password = '';
  @observable String confirmPassword = '';
  @observable bool isLoading = false;
  @observable String? errorMessage;

  final UserRepository _userRepository = GetIt.I<UserRepository>();

  @computed
  bool get passwordsMatch => password == confirmPassword;

  @computed
  bool get canSubmit =>
      name.trim().length >= 2 &&
          email.trim().isNotEmpty &&
          email.contains('@') &&
          password.length >= 6 &&
          passwordsMatch &&
          !isLoading;

  @computed
  bool get hasError => errorMessage != null;

  @action void setName(String v) => name = v.trim();
  @action void setEmail(String v) => email = v.trim();
  @action void setPassword(String v) => password = v;
  @action void setConfirmPassword(String v) => confirmPassword = v;

  @action
  Future<bool> register() async {
    if (!canSubmit) return false;

    isLoading = true;
    errorMessage = null;

    try {
      // Регистрируем пользователя через Supabase
      final success = await _userRepository.signUp(
        email: email,
        password: password,
        name: name,
      );
      
      return success;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
    }
  }
}