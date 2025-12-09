import 'package:prack_10/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository _repository;

  DeleteUserUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteUser(id);
  }
}

