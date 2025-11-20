import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/notes/models/note.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;
abstract class _FavoritesStore with Store {
  final ObservableList<Note> notes = GetIt.I<ObservableList<Note>>();
  @observable
  String searchQuery = '';
  @observable
  String selectedCategory = 'Все категории';
  @observable
  String sortCriteria = 'Дата создания';

  @computed
  List<Note> get filteredNotes {
    final query = searchQuery.toLowerCase();
    var list = notes.where((note) {
      final matchesQuery = note.title.toLowerCase().contains(query) ||
          note.content.toLowerCase().contains(query);
      final matchesCategory = selectedCategory == 'Все категории' ||
          note.category == selectedCategory;
      return matchesQuery && matchesCategory && note.isFavorite && !note.isArchived;
    }).toList();
    list.sort((a, b) {
      switch (sortCriteria) {
        case 'Заголовок':
          return a.title.compareTo(b.title);
        case 'Дата создания':
          return b.creationDate.compareTo(a.creationDate);
        default:
          return 0;
      }
    });
    return list;
  }
  @action
  void setSearchQuery(String query) {
    searchQuery = query;
  }
  @action
  void setSelectedCategory(String category) {
    selectedCategory = category;
  }
  @action
  void setSortCriteria(String criteria) {
    sortCriteria = criteria;
  }
  @action
  void deleteNote(String id) {
    notes.removeWhere((note) => note.id == id);
  }
  @action
  void toggleFavorite(String id) {
    final index = notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      notes[index].isFavorite = !notes[index].isFavorite;
    }
  }

  @action
  void toggleArchive(String id) {
    final index = notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      notes[index].isArchived = !notes[index].isArchived;
    }
  }
}