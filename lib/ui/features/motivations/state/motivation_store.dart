// state/motivation_store.dart
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'dart:math';
import 'package:prack_10/domain/usecases/motivations/get_quotes_by_category_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_facts_by_category_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_categories_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_quote_of_the_day_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_random_quote_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/search_quotes_usecase.dart';
import 'package:prack_10/domain/usecases/motivations/get_quotes_by_author_usecase.dart';

part 'motivation_store.g.dart';

class MotivationStore = _MotivationStore with _$MotivationStore;

abstract class _MotivationStore with Store {
  final Random _random = Random();
  final GetQuotesByCategoryUseCase _getQuotesByCategoryUseCase = GetIt.I<GetQuotesByCategoryUseCase>();
  final GetFactsByCategoryUseCase _getFactsByCategoryUseCase = GetIt.I<GetFactsByCategoryUseCase>();
  final GetMotivationCategoriesUseCase _getCategoriesUseCase = GetIt.I<GetMotivationCategoriesUseCase>();
  final GetQuoteOfTheDayUseCase _getQuoteOfTheDayUseCase = GetIt.I<GetQuoteOfTheDayUseCase>();
  final GetRandomQuoteUseCase _getRandomQuoteUseCase = GetIt.I<GetRandomQuoteUseCase>();
  final SearchQuotesUseCase _searchQuotesUseCase = GetIt.I<SearchQuotesUseCase>();
  final GetQuotesByAuthorUseCase _getQuotesByAuthorUseCase = GetIt.I<GetQuotesByAuthorUseCase>();

  // Локальные состояния загрузки
  @observable bool isQuoteOfTheDayLoading = false;
  @observable bool isRandomLoading = false;
  @observable bool isCategoryLoading = false;
  @observable bool isFactLoading = false;
  @observable bool isSearchLoading = false;
  @observable bool isAuthorLoading = false;

  @observable
  String selectedCategory = 'Все категории';

  @observable
  ObservableList<String> categories = <String>[].asObservable();

  @observable
  ObservableList<String> searchQuotesList = <String>[].asObservable();

  @observable
  ObservableList<String> authorQuotesList = <String>[].asObservable();

  @observable
  ObservableList<String> categoryQuotesList = <String>[].asObservable();

  @observable
  ObservableList<String> currentFacts = <String>[].asObservable();

  @observable String? quoteOfTheDay;
  @observable String? randomQuote;
  @observable String? currentSearchQuote;
  @observable String? currentAuthorQuote;
  @observable String? currentCategoryQuote;
  @observable String? currentFact;

  @observable String? searchQuery;
  @observable String? authorFilter;

  // -----------------------------
  // Категории
  // -----------------------------
  @action
  Future<void> loadCategories() async {
    try {
      final cats = await _getCategoriesUseCase();
      categories = cats.toList().asObservable();
      if (categories.isNotEmpty && !categories.contains(selectedCategory)) {
        selectedCategory = categories.first;
      }
    } catch (_) {
      categories = ['Все категории'].asObservable();
    }
  }

  // -----------------------------
  // Цитата дня
  // -----------------------------
  @action
  Future<void> loadQuoteOfTheDay() async {
    try {
      isQuoteOfTheDayLoading = true;
      final quote = await _getQuoteOfTheDayUseCase();
      quoteOfTheDay = quote.text;
    } catch (_) {
      quoteOfTheDay = 'Не удалось загрузить цитату дня';
    } finally {
      isQuoteOfTheDayLoading = false;
    }
  }

  // -----------------------------
  // Случайная цитата
  // -----------------------------
  @action
  Future<void> loadRandomQuote() async {
    try {
      isRandomLoading = true;
      final quote = await _getRandomQuoteUseCase();
      randomQuote = quote.text;
    } catch (_) {
      randomQuote = 'Не удалось загрузить случайную цитату';
    } finally {
      isRandomLoading = false;
    }
  }

  // -----------------------------
  // Поиск цитат
  // -----------------------------
  @action
  Future<void> search(String query) async {
    if (query.isEmpty) {
      searchQuery = null;
      searchQuotesList.clear();
      currentSearchQuote = null;
      return;
    }

    try {
      isSearchLoading = true;
      searchQuery = query;
      authorFilter = null;

      final quotes = await _searchQuotesUseCase(query);
      searchQuotesList = quotes.map((q) => q.text).toList().asObservable()..shuffle(_random);

      currentSearchQuote = searchQuotesList.isNotEmpty ? searchQuotesList.first : null;
    } catch (_) {
      searchQuotesList.clear();
      currentSearchQuote = null;
    } finally {
      isSearchLoading = false;
    }
  }

  @action
  void nextSearchQuote() {
    if (searchQuotesList.isNotEmpty) {
      currentSearchQuote = (searchQuotesList..shuffle(_random)).first;
    }
  }

  // -----------------------------
  // Фильтр по автору
  // -----------------------------
  @action
  Future<void> filterByAuthor(String author) async {
    if (author.isEmpty) {
      authorFilter = null;
      authorQuotesList.clear();
      currentAuthorQuote = null;
      return;
    }

    try {
      isAuthorLoading = true;
      authorFilter = author;
      searchQuery = null;

      final quotes = await _getQuotesByAuthorUseCase(author);
      authorQuotesList = quotes.map((q) => q.text).toList().asObservable()..shuffle(_random);

      currentAuthorQuote = authorQuotesList.isNotEmpty ? authorQuotesList.first : null;
    } catch (_) {
      authorQuotesList.clear();
      currentAuthorQuote = null;
    } finally {
      isAuthorLoading = false;
    }
  }

  @action
  void nextAuthorQuote() {
    if (authorQuotesList.isNotEmpty) {
      currentAuthorQuote = (authorQuotesList..shuffle(_random)).first;
    }
  }

  // -----------------------------
  // Категории + факты
  // -----------------------------
  @action
  Future<void> setCategory(String category) async {
    selectedCategory = category;
    searchQuery = null;
    authorFilter = null;

    await _refreshCategory();
    await _refreshFacts();
  }

  @action
  Future<void> _refreshCategory() async {
    try {
      isCategoryLoading = true;

      final quotes = await _getQuotesByCategoryUseCase(selectedCategory);
      categoryQuotesList = quotes.toList().asObservable()..shuffle(_random);

      currentCategoryQuote =
      categoryQuotesList.isNotEmpty ? categoryQuotesList.first : null;
    } finally {
      isCategoryLoading = false;
    }
  }

  @action
  Future<void> _refreshFacts() async {
    try {
      isFactLoading = true;

      final facts = await _getFactsByCategoryUseCase(selectedCategory);
      currentFacts = facts.toList().asObservable()..shuffle(_random);

      currentFact = currentFacts.isNotEmpty ? currentFacts.first : null;
    } finally {
      isFactLoading = false;
    }
  }

  @action
  void nextCategoryQuote() {
    if (categoryQuotesList.isNotEmpty) {
      currentCategoryQuote = (categoryQuotesList..shuffle(_random)).first;
    }
  }

  @action
  void nextFact() {
    if (currentFacts.isNotEmpty) {
      currentFact = (currentFacts..shuffle(_random)).first;
    }
  }

  // -----------------------------
  // Обновить всё (локально!)
  // -----------------------------
  @action
  Future<void> refreshAll() async {
    loadQuoteOfTheDay();
    loadRandomQuote();
    _refreshCategory();
    _refreshFacts();
  }

  Future<void> initialize() async {
    await loadCategories();
    await loadQuoteOfTheDay();
    await loadRandomQuote();
    await _refreshCategory();
    await _refreshFacts();
  }
}
