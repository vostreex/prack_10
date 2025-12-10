import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';
import 'package:prack_10/data/datasources/reflection_local_datasource.dart';

class ReflectionRepositoryImpl implements ReflectionRepository {
  final ReflectionLocalDataSource _dataSource;

  ReflectionRepositoryImpl(this._dataSource);

  @override
  Future<List<ReflectionEntry>> getAllReflections() async {
    return await _dataSource.getAllReflections();
  }

  @override
  Future<ReflectionEntry?> getReflectionById(String id) async {
    return await _dataSource.getReflectionById(id);
  }

  @override
  Future<void> addReflection(ReflectionEntry reflection) async {
    await _dataSource.addReflection(reflection);
  }

  @override
  Future<void> updateReflection(ReflectionEntry reflection) async {
    await _dataSource.updateReflection(reflection);
  }

  @override
  Future<void> deleteReflection(String id) async {
    await _dataSource.deleteReflection(id);
  }

  @override
  Future<List<String>> getQuestions() async {
    return _dataSource.getQuestions();
  }
}
