// features/auth/presentation/state/login_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable String email = '';
  @observable String password = '';
  @observable bool isLoading = false;
  @observable String? errorMessage;

  final UserRepository _userRepository = GetIt.I<UserRepository>();

  @computed
  bool get canSubmit => email.contains('@') && password.length >= 6 && !isLoading;

  @computed
  bool get hasError => errorMessage != null;

  @action void setEmail(String v) => email = v.trim();
  @action void setPassword(String v) => password = v;

  @action
  Future<bool> login() async {
    if (!canSubmit) return false;

    isLoading = true;
    errorMessage = null;

    try {
      final success = await _userRepository.login(email, password);
      return success;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
    }
  }
}