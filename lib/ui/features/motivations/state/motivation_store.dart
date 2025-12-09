// state/motivation_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'dart:math';
import 'package:prack_10/domain/usecases/motivations/get_quotes_by_category_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_facts_by_category_usecase.dart';

part 'motivation_store.g.dart';

class MotivationStore = _MotivationStore with _$MotivationStore;

abstract class _MotivationStore with Store {
  final Random _random = Random();
  final GetQuotesByCategoryUseCase _getQuotesByCategoryUseCase = GetIt.I<GetQuotesByCategoryUseCase>();
  final GetFactsByCategoryUseCase _getFactsByCategoryUseCase = GetIt.I<GetFactsByCategoryUseCase>();

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

  @action
  Future<void> setCategory(String category) async {
    selectedCategory = category;
    await _refreshContent();
  }

  @action
  Future<void> _refreshContent() async {
    final quotes = await _getQuotesByCategoryUseCase(selectedCategory);
    final facts = await _getFactsByCategoryUseCase(selectedCategory);

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
  Future<void> refreshAll() async {
    await _refreshContent();
  }

  MotivationStore() {
    // Инициализация будет выполнена асинхронно через initialize()
  }

  Future<void> initialize() async {
    await _refreshContent();
  }
}