import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'note.g.dart';
class Note = _Note with _$Note;
abstract class _Note with Store {
  @observable
  String id;
  @observable
  String title;
  @observable
  String content;
  @observable
  String category;
  @observable
  DateTime creationDate;
  @observable
  bool isFavorite;
  @observable
  bool isArchived;

  _Note({
    required this.title,
    required this.content,
    this.category = 'Без категории',
    DateTime? creationDate,
    String? id,
    this.isFavorite = false,
    this.isArchived = false,
  })  : id = id ?? const Uuid().v4(),
        creationDate = creationDate ?? DateTime.now();
}