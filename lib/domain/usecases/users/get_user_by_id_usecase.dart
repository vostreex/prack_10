import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

class GetUserByIdUseCase {
  final UserRepository _repository;

  GetUserByIdUseCase(this._repository);

  Future<User?> call(String id) async {
    return await _repository.getUserById(id);
  }
}

