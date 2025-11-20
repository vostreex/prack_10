// features/auth/presentation/state/login_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../model/user.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable String email = '';
  @observable String password = '';
  @observable bool isLoading = false;
  @observable String? errorMessage;

  final ObservableList<User> _users = GetIt.I<ObservableList<User>>();

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
      await Future.delayed(const Duration(milliseconds: 800));

      final success = _users.any((u) =>
      u.email.toLowerCase() == email.toLowerCase() && u.password == password);

      if (!success) {
        errorMessage = 'Неверный email или пароль';
      }

      return success;
    } catch (e) {
      errorMessage = 'Ошибка входа';
      return false;
    } finally {
      isLoading = false;
    }
  }
}