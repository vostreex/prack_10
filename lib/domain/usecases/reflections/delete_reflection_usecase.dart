import 'package:prack_10/domain/repositories/reflection_repository.dart';

class DeleteReflectionUseCase {
  final ReflectionRepository _repository;

  DeleteReflectionUseCase(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteReflection(id);
  }
}

