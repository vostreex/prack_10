import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';

class AddReflectionUseCase {
  final ReflectionRepository _repository;

  AddReflectionUseCase(this._repository);

  Future<void> call(ReflectionEntry reflection) async {
    await _repository.addReflection(reflection);
  }
}

