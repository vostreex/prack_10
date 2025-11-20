// state/motivation_store.dart
import 'package:mobx/mobx.dart';
import 'dart:math';
import '../models/motivation_data.dart';

part 'motivation_store.g.dart';

class MotivationStore = _MotivationStore with _$MotivationStore;

abstract class _MotivationStore with Store {
  final Random _random = Random();

  @observable
  String selectedCategory = 'Все категории';

  // Храним уже отфильтрованные списки (чтобы не пересчитывать каждый раз)
  @observable
  ObservableList<String> currentQuotes = <String>[].asObservable();

  @observable
  ObservableList<String> currentFacts = <String>[].asObservable();

  @observable
  String? currentQuote;

  @observable
  String? currentFact;

  @computed
  List<String> get _allQuotes {
    if (selectedCategory == 'Все категории') {
      return MotivationData.categorizedQuotes.values.expand((e) => e).toList();
    }
    return MotivationData.categorizedQuotes[selectedCategory] ??
        MotivationData.categorizedQuotes['Без категории'] ??
        [];
  }

  @computed
  List<String> get _allFacts {
    if (selectedCategory == 'Все категории') {
      return MotivationData.categorizedFacts.values.expand((e) => e).toList();
    }
    return MotivationData.categorizedFacts[selectedCategory] ??
        MotivationData.categorizedFacts['Без категории'] ??
        [];
  }

  @action
  void setCategory(String category) {
    selectedCategory = category;
    _refreshContent();
  }

  @action
  void _refreshContent() {
    final quotes = _allQuotes;
    final facts = _allFacts;

    currentQuotes = quotes.toList().asObservable()..shuffle(_random);
    currentFacts = facts.toList().asObservable()..shuffle(_random);

    // Сразу выбираем по одной
    currentQuote = currentQuotes.isNotEmpty ? currentQuotes.first : null;
    currentFact = currentFacts.isNotEmpty ? currentFacts.first : null;
  }

  @action
  void nextQuote() {
    if (currentQuotes.isEmpty) return;
    currentQuote = (currentQuotes..shuffle(_random)).first;
  }

  @action
  void nextFact() {
    if (currentFacts.isEmpty) return;
    currentFact = (currentFacts..shuffle(_random)).first;
  }

  @action
  void refreshAll() {
    _refreshContent();
  }

  MotivationStore() {
    _refreshContent();
  }
}