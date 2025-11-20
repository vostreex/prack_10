import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/notes/models/note.dart';

part 'add_note_store.g.dart';

class AddNoteStore = _AddNoteStore with _$AddNoteStore;

abstract class _AddNoteStore with Store {
  final ObservableList<Note> notes = GetIt.I<ObservableList<Note>>();

  @observable
  String title = '';

  @observable
  String body = '';

  @observable
  String selectedCategory = 'Все категории';

  @action
  void addNote(Note note) {
    notes.add(note);
  }

  @action
  void setSelectedCategory(String category) {
    selectedCategory = category;
  }

  @action
  void setTitle(String title) {
    title = title;
  }

  @action
  void setBody(String body) {
    body = body;
  }
}