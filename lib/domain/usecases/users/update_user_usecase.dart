import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository _repository;

  UpdateUserUseCase(this._repository);

  Future<void> call(User user) async {
    await _repository.updateUser(user);
  }
}

