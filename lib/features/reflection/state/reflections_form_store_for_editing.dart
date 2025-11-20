import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/reflection/models/reflection_entry.dart';


import '../models/questions.dart';

part 'reflections_form_store_for_editing.g.dart';

class ReflectionFormStoreEdit = _ReflectionFormStoreEdit with _$ReflectionFormStoreEdit;

abstract class _ReflectionFormStoreEdit with Store {
  final ReflectionEntry? entry;

  _ReflectionFormStoreEdit({this.entry}) {
    final localEntry = entry;
    if (localEntry != null) {
      final ans = localEntry.answers.toList();
      while (ans.length < reflectionQuestions.length) {
        ans.add('');
      }
      answers = ObservableList.of(ans);
      additionalNotes = localEntry.additionalNotes;
    } else {
      answers = ObservableList.of(List.generate(reflectionQuestions.length, (_) => ''));
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
  void save() {
    final localEntry = entry;
    if (localEntry != null) {
      localEntry.answers.replaceRange(0, localEntry.answers.length, answers);
      localEntry.additionalNotes = additionalNotes;
    } else {
      final newEntry = ReflectionEntry(
        answers: answers.toList(),
        additionalNotes: additionalNotes,
      );
      GetIt.I<ObservableList<ReflectionEntry>>().add(newEntry);
    }
  }
}