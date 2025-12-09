import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/usecases/notes/get_notes_usecase.dart';
import 'package:prack_10/domain/usecases/notes/delete_note_usecase.dart';
import 'package:prack_10/domain/usecases/notes/toggle_favorite_note_usecase.dart';
import 'package:prack_10/domain/usecases/notes/toggle_archive_note_usecase.dart';

part 'notes_list_store.g.dart';

class NotesListStore = _NotesListStore with _$NotesListStore;
abstract class _NotesListStore with Store {
  final GetNotesUseCase _getNotesUseCase = GetIt.I<GetNotesUseCase>();
  final DeleteNoteUseCase _deleteNoteUseCase = GetIt.I<DeleteNoteUseCase>();
  final ToggleFavoriteNoteUseCase _toggleFavoriteUseCase = GetIt.I<ToggleFavoriteNoteUseCase>();
  final ToggleArchiveNoteUseCase _toggleArchiveUseCase = GetIt.I<ToggleArchiveNoteUseCase>();

  @observable
  ObservableList<Note> notes = ObservableList<Note>();
  @observable
  String searchQuery = '';
  @observable
  String selectedCategory = 'Все категории';
  @observable
  String sortCriteria = 'Дата создания';
  
  _NotesListStore() {
    _loadNotes();
  }
  
  @action
  Future<void> _loadNotes() async {
    final notesList = await _getNotesUseCase();
    notes = ObservableList<Note>.of(notesList);
  }
  @computed
  List<Note> get filteredNotes {
    final query = searchQuery.toLowerCase();
    var list = notes.where((note) {
      final matchesQuery = note.title.toLowerCase().contains(query) ||
          note.content.toLowerCase().contains(query);
      final matchesCategory = selectedCategory == 'Все категории' ||
          note.category == selectedCategory;
      return matchesQuery && matchesCategory && !note.isArchived;
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
  Future<void> deleteNote(String id) async {
    await _deleteNoteUseCase(id);
    await _loadNotes();
  }
  
  @action
  Future<void> toggleFavorite(String id) async {
    await _toggleFavoriteUseCase(id);
    await _loadNotes();
  }
  
  @action
  Future<void> toggleArchive(String id) async {
    await _toggleArchiveUseCase(id);
    await _loadNotes();
  }

  @action
  Future<void> refreshNotes() async {
    await _loadNotes();
  }
}