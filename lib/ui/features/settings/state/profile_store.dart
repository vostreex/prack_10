// features/profile/state/profile_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  @observable
  User? currentUser;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  _ProfileStore() {
    _loadUser();
  }

  @action
  Future<void> _loadUser() async {
    isLoading = true;
    try {
      currentUser = await _userRepository.getCurrentUser();
    } catch (e) {
      errorMessage = 'Ошибка загрузки профиля';
    } finally {
      isLoading = false;
    }
  }

  @computed
  String get userName => currentUser?.name ?? 'Гость';

  @computed
  String get userEmail => currentUser?.email ?? 'Не указан';

  @computed
  String get initials => userName.isNotEmpty ? userName[0].toUpperCase() : 'U';

  @observable
  String newPassword = '';

  @observable
  String confirmPassword = '';

  @observable
  bool isPasswordVisible = false;

  @action
  void setNewPassword(String value) => newPassword = value.trim();

  @action
  void setConfirmPassword(String value) => confirmPassword = value.trim();

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @action
  Future<bool> changePassword() async {
    if (!canSavePassword) return false;

    isLoading = true;
    errorMessage = null;

    try {
      await _userRepository.updatePassword(newPassword);
      
      newPassword = '';
      confirmPassword = '';
      isPasswordVisible = false;
      
      return true;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get canSavePassword =>
      newPassword.length >= 6 &&
          newPassword == confirmPassword &&
          confirmPassword.isNotEmpty;
}
