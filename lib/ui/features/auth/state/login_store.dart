// features/auth/presentation/state/login_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/models/user.dart';
import 'package:prack_10/domain/usecases/users/get_users_usecase.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable String email = '';
  @observable String password = '';
  @observable bool isLoading = false;
  @observable String? errorMessage;

  final GetUsersUseCase _getUsersUseCase = GetIt.I<GetUsersUseCase>();

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

      final users = await _getUsersUseCase();
      final success = users.any((u) =>
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