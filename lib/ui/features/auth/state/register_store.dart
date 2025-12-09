// features/auth/presentation/state/register_store.dart
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/models/user.dart';
import 'package:prack_10/domain/usecases/users/get_users_usecase.dart';
import 'package:prack_10/domain/usecases/users/add_user_usecase.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable String name = '';
  @observable String email = '';
  @observable String password = '';
  @observable String confirmPassword = '';
  @observable bool isLoading = false;
  @observable String? errorMessage;

  final GetUsersUseCase _getUsersUseCase = GetIt.I<GetUsersUseCase>();
  final AddUserUseCase _addUserUseCase = GetIt.I<AddUserUseCase>();

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
      final users = await _getUsersUseCase();
      final exists = users.any((u) => u.email.toLowerCase() == email.toLowerCase());
      if (exists) {
        errorMessage = 'Пользователь с таким email уже существует';
        return false;
      }
      final user = User(name: name, email: email, password: password);
      await _addUserUseCase(user);
      return true;
    } catch (e) {
      errorMessage = 'Ошибка регистрации';
      return false;
    } finally {
      isLoading = false;
    }
  }
}