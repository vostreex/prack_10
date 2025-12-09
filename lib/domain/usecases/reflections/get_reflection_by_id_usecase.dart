import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';

class GetReflectionByIdUseCase {
  final ReflectionRepository _repository;

  GetReflectionByIdUseCase(this._repository);

  Future<ReflectionEntry?> call(String id) async {
    return await _repository.getReflectionById(id);
  }
}

