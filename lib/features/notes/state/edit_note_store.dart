import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/notes/models/note.dart';

part 'edit_note_store.g.dart';

class EditNoteStore = _EditNoteStore with _$EditNoteStore;

abstract class _EditNoteStore with Store {
  final ObservableList<Note> notes = GetIt.I<ObservableList<Note>>();

  @observable
  String title = '';

  @observable
  String body = '';

  @observable
  String selectedCategory = 'Все категории';

  @action
  void updateNote(String id, Note updatedNote) {
    final index = notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      notes[index].title = updatedNote.title;
      notes[index].content = updatedNote.content;
      notes[index].category = updatedNote.category;
    }
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