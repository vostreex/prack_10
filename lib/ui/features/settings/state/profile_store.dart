// features/profile/state/profile_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/usecases/users/get_users_usecase.dart';
import 'package:prack_10/domain/usecases/users/update_user_usecase.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final GetUsersUseCase _getUsersUseCase = GetIt.I<GetUsersUseCase>();
  final UpdateUserUseCase _updateUserUseCase = GetIt.I<UpdateUserUseCase>();

  @observable
  ObservableList<User> users = ObservableList<User>();

  _ProfileStore() {
    _loadUsers();
  }

  @action
  Future<void> _loadUsers() async {
    final usersList = await _getUsersUseCase();
    users = ObservableList<User>.of(usersList);
  }

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
  Future<void> changePassword() async {
    if (currentUser == null) return;
    if (!canSavePassword) return;

    final user = currentUser!;
    final updatedUser = user.copyWith(password: newPassword);
    await _updateUserUseCase(updatedUser);
    await _loadUsers();

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