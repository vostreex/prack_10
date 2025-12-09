import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

class AddUserUseCase {
  final UserRepository _repository;

  AddUserUseCase(this._repository);

  Future<void> call(User user) async {
    await _repository.addUser(user);
  }
}

