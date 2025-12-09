import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/core/models/onboarding_page.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

abstract class _OnboardingStore with Store {
  @observable
  int currentPage = 0;

  @observable
  bool isLastPage = false;

  final List<OnboardingPage> pages = const [
    OnboardingPage(
      title: 'Добро пожаловать!',
      description: 'Это твой личный помощник на пути к лучшей версии себя',
      iconCodePoint: 0xe5d0, // Icons.auto_awesome_rounded
      colorValue: 0xFF673AB7, // Colors.deepPurple
    ),
    OnboardingPage(
      title: 'Заметки и мысли',
      description: 'Записывай идеи, планы и всё важное — всё в одном месте',
      iconCodePoint: 0xe873, // Icons.note_alt_rounded
      colorValue: 0xFF3F51B5, // Colors.indigo
    ),
    OnboardingPage(
      title: 'Задачи под контролем',
      description: 'Ставь цели, отслеживай прогресс и ничего не забывай',
      iconCodePoint: 0xe5d2, // Icons.checklist_rounded
      colorValue: 0xFF009688, // Colors.teal
    ),
    OnboardingPage(
      title: 'Формируй привычки',
      description: 'Маленькие шаги каждый день = большие результаты через год',
      iconCodePoint: 0xe863, // Icons.autorenew_rounded
      colorValue: 0xFF673AB7, // Colors.deepPurple
    ),
    OnboardingPage(
      title: 'Ежедневная рефлексия',
      description: 'Осмысливай день, учись на опыте и расти осознанно',
      iconCodePoint: 0xe8dc, // Icons.psychology_rounded
      colorValue: 0xFFFF5722, // Colors.deepOrange
    ),
    OnboardingPage(
      title: 'Мотивация каждый день',
      description: 'Цитаты, аффирмации и напоминания о том, зачем ты это делаешь',
      iconCodePoint: 0xe53e, // Icons.local_fire_department_rounded
      colorValue: 0xFFF59E0B,
    ),
  ];

  @action
  void setPage(int index) {
    currentPage = index;
    isLastPage = index == pages.length - 1;
  }

  @action
  void nextPage() {
    if (currentPage < pages.length - 1) {
      currentPage++;
      isLastPage = currentPage == pages.length - 1;
    }
  }

  @action
  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      isLastPage = false;
    }
  }
}
