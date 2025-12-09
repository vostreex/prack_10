import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';
import 'package:prack_10/data/datasources/reflection_local_datasource.dart';

class ReflectionRepositoryImpl implements ReflectionRepository {
  final ReflectionLocalDataSource _dataSource;

  ReflectionRepositoryImpl(this._dataSource);

  @override
  Future<List<ReflectionEntry>> getAllReflections() async {
    return _dataSource.reflections.toList();
  }

  @override
  Future<ReflectionEntry?> getReflectionById(String id) async {
    try {
      return _dataSource.reflections.firstWhere((reflection) => reflection.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addReflection(ReflectionEntry reflection) async {
    _dataSource.reflections.add(reflection);
  }

  @override
  Future<void> updateReflection(ReflectionEntry reflection) async {
    final index = _dataSource.reflections.indexWhere((r) => r.id == reflection.id);
    if (index != -1) {
      _dataSource.reflections[index] = reflection;
    }
  }

  @override
  Future<void> deleteReflection(String id) async {
    _dataSource.reflections.removeWhere((reflection) => reflection.id == id);
  }

  @override
  Future<List<String>> getQuestions() async {
    return _dataSource.getQuestions();
  }
}

