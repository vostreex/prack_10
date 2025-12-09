import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/usecases/notes/add_note_usecase.dart';

part 'add_note_store.g.dart';

class AddNoteStore = _AddNoteStore with _$AddNoteStore;

abstract class _AddNoteStore with Store {
  final AddNoteUseCase _addNoteUseCase = GetIt.I<AddNoteUseCase>();

  @observable
  String title = '';

  @observable
  String body = '';

  @observable
  String selectedCategory = 'Все категории';

  @action
  Future<void> addNote(Note note) async {
    await _addNoteUseCase(note);
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