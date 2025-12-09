// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MotivationStore on _MotivationStore, Store {
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

  late final _$currentQuotesAtom = Atom(
    name: '_MotivationStore.currentQuotes',
    context: context,
  );

  @override
  ObservableList<String> get currentQuotes {
    _$currentQuotesAtom.reportRead();
    return super.currentQuotes;
  }

  @override
  set currentQuotes(ObservableList<String> value) {
    _$currentQuotesAtom.reportWrite(value, super.currentQuotes, () {
      super.currentQuotes = value;
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

  late final _$currentQuoteAtom = Atom(
    name: '_MotivationStore.currentQuote',
    context: context,
  );

  @override
  String? get currentQuote {
    _$currentQuoteAtom.reportRead();
    return super.currentQuote;
  }

  @override
  set currentQuote(String? value) {
    _$currentQuoteAtom.reportWrite(value, super.currentQuote, () {
      super.currentQuote = value;
    });
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

  late final _$setCategoryAsyncAction = AsyncAction(
    '_MotivationStore.setCategory',
    context: context,
  );

  @override
  Future<void> setCategory(String category) {
    return _$setCategoryAsyncAction.run(() => super.setCategory(category));
  }

  late final _$_refreshContentAsyncAction = AsyncAction(
    '_MotivationStore._refreshContent',
    context: context,
  );

  @override
  Future<void> _refreshContent() {
    return _$_refreshContentAsyncAction.run(() => super._refreshContent());
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
  void nextQuote() {
    final _$actionInfo = _$_MotivationStoreActionController.startAction(
      name: '_MotivationStore.nextQuote',
    );
    try {
      return super.nextQuote();
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
selectedCategory: ${selectedCategory},
currentQuotes: ${currentQuotes},
currentFacts: ${currentFacts},
currentQuote: ${currentQuote},
currentFact: ${currentFact}
    ''';
  }
}
