import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/domain/usecases/notes/update_note_usecase.dart';

part 'edit_note_store.g.dart';

class EditNoteStore = _EditNoteStore with _$EditNoteStore;

abstract class _EditNoteStore with Store {
  final UpdateNoteUseCase _updateNoteUseCase = GetIt.I<UpdateNoteUseCase>();

  @observable
  String title = '';

  @observable
  String body = '';

  @observable
  String selectedCategory = 'Все категории';

  @action
  Future<void> updateNote(String id, Note updatedNote) async {
    await _updateNoteUseCase(updatedNote);
  }

  @action
  void setSelectedCategory(String category) {
    selectedCategory = category;
  }

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setBody(String value) {
    body = value;
  }
}