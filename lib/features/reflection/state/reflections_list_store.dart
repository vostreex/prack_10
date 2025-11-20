import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/reflection/models/reflection_entry.dart';

part 'reflections_list_store.g.dart';

class ReflectionsListStore = _ReflectionsListStore with _$ReflectionsListStore;

abstract class _ReflectionsListStore with Store {
  final ObservableList<ReflectionEntry> reflections = GetIt.I<ObservableList<ReflectionEntry>>();

  @observable
  String searchQuery = '';

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
  void deleteReflection(String id) {
    reflections.removeWhere((reflection) => reflection.id == id);
  }
}