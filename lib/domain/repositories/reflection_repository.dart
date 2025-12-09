import 'package:prack_10/core/models/reflection_entry.dart';

abstract class ReflectionRepository {
  Future<List<ReflectionEntry>> getAllReflections();
  Future<ReflectionEntry?> getReflectionById(String id);
  Future<void> addReflection(ReflectionEntry reflection);
  Future<void> updateReflection(ReflectionEntry reflection);
  Future<void> deleteReflection(String id);
  Future<List<String>> getQuestions();
}

