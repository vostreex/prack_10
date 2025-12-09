import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';

class GetReflectionsUseCase {
  final ReflectionRepository _repository;

  GetReflectionsUseCase(this._repository);

  Future<List<ReflectionEntry>> call() async {
    return await _repository.getAllReflections();
  }
}

