// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on _OnboardingStore, Store {
  late final _$currentPageAtom = Atom(
    name: '_OnboardingStore.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isLastPageAtom = Atom(
    name: '_OnboardingStore.isLastPage',
    context: context,
  );

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$_OnboardingStoreActionController = ActionController(
    name: '_OnboardingStore',
    context: context,
  );

  @override
  void setPage(int index) {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
      name: '_OnboardingStore.setPage',
    );
    try {
      return super.setPage(index);
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
      name: '_OnboardingStore.nextPage',
    );
    try {
      return super.nextPage();
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousPage() {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
      name: '_OnboardingStore.previousPage',
    );
    try {
      return super.previousPage();
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
isLastPage: ${isLastPage}
    ''';
  }
}
