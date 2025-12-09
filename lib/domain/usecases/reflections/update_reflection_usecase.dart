import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';

class UpdateReflectionUseCase {
  final ReflectionRepository _repository;

  UpdateReflectionUseCase(this._repository);

  Future<void> call(ReflectionEntry reflection) async {
    await _repository.updateReflection(reflection);
  }
}

