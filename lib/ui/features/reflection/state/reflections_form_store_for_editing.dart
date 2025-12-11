import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/data/datasources/local/reflection_local_datasource.dart';
import 'package:prack_10/domain/usecases/reflections/add_reflection_usecase.dart';
import 'package:prack_10/domain/usecases/reflections/update_reflection_usecase.dart';

part 'reflections_form_store_for_editing.g.dart';

class ReflectionFormStoreEdit = _ReflectionFormStoreEdit with _$ReflectionFormStoreEdit;

abstract class _ReflectionFormStoreEdit with Store {
  final ReflectionEntry? entry;
  final ReflectionLocalDataSource _dataSource = GetIt.I<ReflectionLocalDataSource>();
  final AddReflectionUseCase _addReflectionUseCase = GetIt.I<AddReflectionUseCase>();
  final UpdateReflectionUseCase _updateReflectionUseCase = GetIt.I<UpdateReflectionUseCase>();

  _ReflectionFormStoreEdit({this.entry}) {
    final questions = _dataSource.getQuestions();
    final localEntry = entry;
    if (localEntry != null) {
      final ans = localEntry.answers.toList();
      while (ans.length < questions.length) {
        ans.add('');
      }
      answers = ObservableList.of(ans);
      additionalNotes = localEntry.additionalNotes;
    } else {
      answers = ObservableList.of(List.generate(questions.length, (_) => ''));
      additionalNotes = '';
    }
  }

  @observable
  late ObservableList<String> answers;

  @observable
  late String additionalNotes;

  @action
  void setAnswer(int index, String value) {
    answers[index] = value;
  }

  @action
  void setAdditionalNotes(String value) {
    additionalNotes = value;
  }

  @action
  Future<void> save() async {
    final localEntry = entry;
    if (localEntry != null) {
      final updatedEntry = localEntry.copyWith(
        answers: answers.toList(),
        additionalNotes: additionalNotes,
      );
      await _updateReflectionUseCase(updatedEntry);
    } else {
      final newEntry = ReflectionEntry(
        answers: answers.toList(),
        additionalNotes: additionalNotes,
      );
      await _addReflectionUseCase(newEntry);
    }
  }
}