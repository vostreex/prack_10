import 'package:prack_10/core/models/user.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';

class GetUserByEmailUseCase {
  final UserRepository _repository;

  GetUserByEmailUseCase(this._repository);

  Future<User?> call(String email) async {
    return await _repository.getUserByEmail(email);
  }
}

