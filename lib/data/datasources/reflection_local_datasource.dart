import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/reflection_entry.dart';

class ReflectionLocalDataSource {
  List<ReflectionEntry> get reflections => GetIt.I<List<ReflectionEntry>>();

  static const List<String> reflectionQuestions = [
    'Что было самым ярким моментом дня?',
    'Что вас огорчило или вызвало трудности?',
    'За что вы благодарны сегодня?',
    'Какие уроки вы извлекли?',
  ];

  List<String> getQuestions() {
    return reflectionQuestions;
  }
}
