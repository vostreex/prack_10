import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'reflection_entry.g.dart';

class ReflectionEntry = _ReflectionEntry with _$ReflectionEntry;

abstract class _ReflectionEntry with Store {
  @observable
  String id;

  @observable
  DateTime creationDate;

  @observable
  ObservableList<String> answers;

  @observable
  String additionalNotes;

  _ReflectionEntry({
    List<String>? answers,
    this.additionalNotes = '',
    DateTime? creationDate,
    String? id,
  })  : id = id ?? const Uuid().v4(),
        creationDate = creationDate ?? DateTime.now(),
        answers = ObservableList.of(answers ?? []);
}