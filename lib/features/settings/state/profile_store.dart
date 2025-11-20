// features/profile/state/profile_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/auth/model/user.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final ObservableList<User> users = GetIt.I<ObservableList<User>>();

  @computed
  User? get currentUser => users.isEmpty ? null : users.first;

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
  void changePassword() {
    if (currentUser == null) return;
    if (!canSavePassword) return;

    currentUser!.password = newPassword;

    newPassword = '';
    confirmPassword = '';
    isPasswordVisible = false;
  }

  @computed
  bool get canSavePassword =>
      newPassword.length >= 6 &&
          newPassword == confirmPassword &&
          confirmPassword.isNotEmpty;
}