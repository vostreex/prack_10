import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/note.dart';

class NoteLocalDataSource {
  List<Note> get notes => GetIt.I<List<Note>>();

  static const List<String> categories = [
    'Все категории',
    'Без категории',
    'Работа',
    'Личное',
    'Учёба',
  ];

  List<String> getCategories() {
    return categories;
  }
}
