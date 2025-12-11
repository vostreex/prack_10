// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MotivationStore on _MotivationStore, Store {
  late final _$isQuoteOfTheDayLoadingAtom = Atom(
    name: '_MotivationStore.isQuoteOfTheDayLoading',
    context: context,
  );

  @override
  bool get isQuoteOfTheDayLoading {
    _$isQuoteOfTheDayLoadingAtom.reportRead();
    return super.isQuoteOfTheDayLoading;
  }

  @override
  set isQuoteOfTheDayLoading(bool value) {
    _$isQuoteOfTheDayLoadingAtom.reportWrite(
      value,
      super.isQuoteOfTheDayLoading,
      () {
        super.isQuoteOfTheDayLoading = value;
      },
    );
  }

  late final _$isRandomLoadingAtom = Atom(
    name: '_MotivationStore.isRandomLoading',
    context: context,
  );

  @override
  bool get isRandomLoading {
    _$isRandomLoadingAtom.reportRead();
    return super.isRandomLoading;
  }

  @override
  set isRandomLoading(bool value) {
    _$isRandomLoadingAtom.reportWrite(value, super.isRandomLoading, () {
      super.isRandomLoading = value;
    });
  }

  late final _$isCategoryLoadingAtom = Atom(
    name: '_MotivationStore.isCategoryLoading',
    context: context,
  );

  @override
  bool get isCategoryLoading {
    _$isCategoryLoadingAtom.reportRead();
    return super.isCategoryLoading;
  }

  @override
  set isCategoryLoading(bool value) {
    _$isCategoryLoadingAtom.reportWrite(value, super.isCategoryLoading, () {
      super.isCategoryLoading = value;
    });
  }

  late final _$isFactLoadingAtom = Atom(
    name: '_MotivationStore.isFactLoading',
    context: context,
  );

  @override
  bool get isFactLoading {
    _$isFactLoadingAtom.reportRead();
    return super.isFactLoading;
  }

  @override
  set isFactLoading(bool value) {
    _$isFactLoadingAtom.reportWrite(value, super.isFactLoading, () {
      super.isFactLoading = value;
    });
  }

  late final _$isSearchLoadingAtom = Atom(
    name: '_MotivationStore.isSearchLoading',
    context: context,
  );

  @override
  bool get isSearchLoading {
    _$isSearchLoadingAtom.reportRead();
    return super.isSearchLoading;
  }

  @override
  set isSearchLoading(bool value) {
    _$isSearchLoadingAtom.reportWrite(value, super.isSearchLoading, () {
      super.isSearchLoading = value;
    });
  }

  late final _$isAuthorLoadingAtom = Atom(
    name: '_MotivationStore.isAuthorLoading',
    context: context,
  );

  @override
  bool get isAuthorLoading {
    _$isAuthorLoadingAtom.reportRead();
    return super.isAuthorLoading;
  }

  @override
  set isAuthorLoading(bool value) {
    _$isAuthorLoadingAtom.reportWrite(value, super.isAuthorLoading, () {
      super.isAuthorLoading = value;
    });
  }

  late final _$selectedCategoryAtom = Atom(
    name: '_MotivationStore.selectedCategory',
    context: context,
  );

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$categoriesAtom = Atom(
    name: '_MotivationStore.categories',
    context: context,
  );

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$searchQuotesListAtom = Atom(
    name: '_MotivationStore.searchQuotesList',
    context: context,
  );

  @override
  ObservableList<String> get searchQuotesList {
    _$searchQuotesListAtom.reportRead();
    return super.searchQuotesList;
  }

  @override
  set searchQuotesList(ObservableList<String> value) {
    _$searchQuotesListAtom.reportWrite(value, super.searchQuotesList, () {
      super.searchQuotesList = value;
    });
  }

  late final _$authorQuotesListAtom = Atom(
    name: '_MotivationStore.authorQuotesList',
    context: context,
  );

  @override
  ObservableList<String> get authorQuotesList {
    _$authorQuotesListAtom.reportRead();
    return super.authorQuotesList;
  }

  @override
  set authorQuotesList(ObservableList<String> value) {
    _$authorQuotesListAtom.reportWrite(value, super.authorQuotesList, () {
      super.authorQuotesList = value;
    });
  }

  late final _$categoryQuotesListAtom = Atom(
    name: '_MotivationStore.categoryQuotesList',
    context: context,
  );

  @override
  ObservableList<String> get categoryQuotesList {
    _$categoryQuotesListAtom.reportRead();
    return super.categoryQuotesList;
  }

  @override
  set categoryQuotesList(ObservableList<String> value) {
    _$categoryQuotesListAtom.reportWrite(value, super.categoryQuotesList, () {
      super.categoryQuotesList = value;
    });
  }

  late final _$currentFactsAtom = Atom(
    name: '_MotivationStore.currentFacts',
    context: context,
  );

  @override
  ObservableList<String> get currentFacts {
    _$currentFactsAtom.reportRead();
    return super.currentFacts;
  }

  @override
  set currentFacts(ObservableList<String> value) {
    _$currentFactsAtom.reportWrite(value, super.currentFacts, () {
      super.currentFacts = value;
    });
  }

  late final _$quoteOfTheDayAtom = Atom(
    name: '_MotivationStore.quoteOfTheDay',
    context: context,
  );

  @override
  String? get quoteOfTheDay {
    _$quoteOfTheDayAtom.reportRead();
    return super.quoteOfTheDay;
  }

  @override
  set quoteOfTheDay(String? value) {
    _$quoteOfTheDayAtom.reportWrite(value, super.quoteOfTheDay, () {
      super.quoteOfTheDay = value;
    });
  }

  late final _$randomQuoteAtom = Atom(
    name: '_MotivationStore.randomQuote',
    context: context,
  );

  @override
  String? get randomQuote {
    _$randomQuoteAtom.reportRead();
    return super.randomQuote;
  }

  @override
  set randomQuote(String? value) {
    _$randomQuoteAtom.reportWrite(value, super.randomQuote, () {
      super.randomQuote = value;
    });
  }

  late final _$currentSearchQuoteAtom = Atom(
    name: '_MotivationStore.currentSearchQuote',
    context: context,
  );

  @override
  String? get currentSearchQuote {
    _$currentSearchQuoteAtom.reportRead();
    return super.currentSearchQuote;
  }

  @override
  set currentSearchQuote(String? value) {
    _$currentSearchQuoteAtom.reportWrite(value, super.currentSearchQuote, () {
      super.currentSearchQuote = value;
    });
  }

  late final _$currentAuthorQuoteAtom = Atom(
    name: '_MotivationStore.currentAuthorQuote',
    context: context,
  );

  @override
  String? get currentAuthorQuote {
    _$currentAuthorQuoteAtom.reportRead();
    return super.currentAuthorQuote;
  }

  @override
  set currentAuthorQuote(String? value) {
    _$currentAuthorQuoteAtom.reportWrite(value, super.currentAuthorQuote, () {
      super.currentAuthorQuote = value;
    });
  }

  late final _$currentCategoryQuoteAtom = Atom(
    name: '_MotivationStore.currentCategoryQuote',
    context: context,
  );

  @override
  String? get currentCategoryQuote {
    _$currentCategoryQuoteAtom.reportRead();
    return super.currentCategoryQuote;
  }

  @override
  set currentCategoryQuote(String? value) {
    _$currentCategoryQuoteAtom.reportWrite(
      value,
      super.currentCategoryQuote,
      () {
        super.currentCategoryQuote = value;
      },
    );
  }

  late final _$currentFactAtom = Atom(
    name: '_MotivationStore.currentFact',
    context: context,
  );

  @override
  String? get currentFact {
    _$currentFactAtom.reportRead();
    return super.currentFact;
  }

  @override
  set currentFact(String? value) {
    _$currentFactAtom.reportWrite(value, super.currentFact, () {
      super.currentFact = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_MotivationStore.searchQuery',
    context: context,
  );

  @override
  String? get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String? value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$authorFilterAtom = Atom(
    name: '_MotivationStore.authorFilter',
    context: context,
  );

  @override
  String? get authorFilter {
    _$authorFilterAtom.reportRead();
    return super.authorFilter;
  }

  @override
  set authorFilter(String? value) {
    _$authorFilterAtom.reportWrite(value, super.authorFilter, () {
      super.authorFilter = value;
    });
  }

  late final _$loadCategoriesAsyncAction = AsyncAction(
    '_MotivationStore.loadCategories',
    context: context,
  );

  @override
  Future<void> loadCategories() {
    return _$loadCategoriesAsyncAction.run(() => super.loadCategories());
  }

  late final _$loadQuoteOfTheDayAsyncAction = AsyncAction(
    '_MotivationStore.loadQuoteOfTheDay',
    context: context,
  );

  @override
  Future<void> loadQuoteOfTheDay() {
    return _$loadQuoteOfTheDayAsyncAction.run(() => super.loadQuoteOfTheDay());
  }

  late final _$loadRandomQuoteAsyncAction = AsyncAction(
    '_MotivationStore.loadRandomQuote',
    context: context,
  );

  @override
  Future<void> loadRandomQuote() {
    return _$loadRandomQuoteAsyncAction.run(() => super.loadRandomQuote());
  }

  late final _$searchAsyncAction = AsyncAction(
    '_MotivationStore.search',
    context: context,
  );

  @override
  Future<void> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  late final _$filterByAuthorAsyncAction = AsyncAction(
    '_MotivationStore.filterByAuthor',
    context: context,
  );

  @override
  Future<void> filterByAuthor(String author) {
    return _$filterByAuthorAsyncAction.run(() => super.filterByAuthor(author));
  }

  late final _$setCategoryAsyncAction = AsyncAction(
    '_MotivationStore.setCategory',
    context: context,
  );

  @override
  Future<void> setCategory(String category) {
    return _$setCategoryAsyncAction.run(() => super.setCategory(category));
  }

  late final _$_refreshCategoryAsyncAction = AsyncAction(
    '_MotivationStore._refreshCategory',
    context: context,
  );

  @override
  Future<void> _refreshCategory() {
    return _$_refreshCategoryAsyncAction.run(() => super._refreshCategory());
  }

  late final _$_refreshFactsAsyncAction = AsyncAction(
    '_MotivationStore._refreshFacts',
    context: context,
  );

  @override
  Future<void> _refreshFacts() {
    return _$_refreshFactsAsyncAction.run(() => super._refreshFacts());
  }

  late final _$refreshAllAsyncAction = AsyncAction(
    '_MotivationStore.refreshAll',
    context: context,
  );

  @override
  Future<void> refreshAll() {
    return _$refreshAllAsyncAction.run(() => super.refreshAll());
  }

  late final _$_MotivationStoreActionController = ActionController(
    name: '_MotivationStore',
    context: context,
  );

  @override
  void nextSearchQuote() {
    final _$actionInfo = _$_MotivationStoreActionController.startAction(
      name: '_MotivationStore.nextSearchQuote',
    );
    try {
      return super.nextSearchQuote();
    } finally {
      _$_MotivationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextAuthorQuote() {
    final _$actionInfo = _$_MotivationStoreActionController.startAction(
      name: '_MotivationStore.nextAuthorQuote',
    );
    try {
      return super.nextAuthorQuote();
    } finally {
      _$_MotivationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextCategoryQuote() {
    final _$actionInfo = _$_MotivationStoreActionController.startAction(
      name: '_MotivationStore.nextCategoryQuote',
    );
    try {
      return super.nextCategoryQuote();
    } finally {
      _$_MotivationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextFact() {
    final _$actionInfo = _$_MotivationStoreActionController.startAction(
      name: '_MotivationStore.nextFact',
    );
    try {
      return super.nextFact();
    } finally {
      _$_MotivationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isQuoteOfTheDayLoading: ${isQuoteOfTheDayLoading},
isRandomLoading: ${isRandomLoading},
isCategoryLoading: ${isCategoryLoading},
isFactLoading: ${isFactLoading},
isSearchLoading: ${isSearchLoading},
isAuthorLoading: ${isAuthorLoading},
selectedCategory: ${selectedCategory},
categories: ${categories},
searchQuotesList: ${searchQuotesList},
authorQuotesList: ${authorQuotesList},
categoryQuotesList: ${categoryQuotesList},
currentFacts: ${currentFacts},
quoteOfTheDay: ${quoteOfTheDay},
randomQuote: ${randomQuote},
currentSearchQuote: ${currentSearchQuote},
currentAuthorQuote: ${currentAuthorQuote},
currentCategoryQuote: ${currentCategoryQuote},
currentFact: ${currentFact},
searchQuery: ${searchQuery},
authorFilter: ${authorFilter}
    ''';
  }
}
