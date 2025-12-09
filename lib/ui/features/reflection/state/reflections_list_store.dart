import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/domain/usecases/reflections/get_reflections_usecase.dart';
import 'package:prack_10/domain/usecases/reflections/delete_reflection_usecase.dart';

part 'reflections_list_store.g.dart';

class ReflectionsListStore = _ReflectionsListStore with _$ReflectionsListStore;

abstract class _ReflectionsListStore with Store {
  final GetReflectionsUseCase _getReflectionsUseCase = GetIt.I<GetReflectionsUseCase>();
  final DeleteReflectionUseCase _deleteReflectionUseCase = GetIt.I<DeleteReflectionUseCase>();

  @observable
  ObservableList<ReflectionEntry> reflections = ObservableList<ReflectionEntry>();

  @observable
  String searchQuery = '';

  _ReflectionsListStore() {
    _loadReflections();
  }

  @action
  Future<void> _loadReflections() async {
    final reflectionsList = await _getReflectionsUseCase();
    reflections = ObservableList<ReflectionEntry>.of(reflectionsList);
  }

  @computed
  List<ReflectionEntry> get filteredReflections {
    final query = searchQuery.toLowerCase();
    var list = reflections.where((reflection) {
      final matchesQuery = reflection.answers.any((answer) => answer.toLowerCase().contains(query)) ||
          reflection.additionalNotes.toLowerCase().contains(query);
      return matchesQuery;
    }).toList();
    list.sort((a, b) => b.creationDate.compareTo(a.creationDate));
    return list;
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
  }

  @action
  Future<void> deleteReflection(String id) async {
    await _deleteReflectionUseCase(id);
    await _loadReflections();
  }
}