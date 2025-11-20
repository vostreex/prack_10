import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prack_10/features/onboarding/models/onboarding_page.dart';

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
      icon: Icons.auto_awesome_rounded,
      color: Colors.deepPurple,
    ),
    OnboardingPage(
      title: 'Заметки и мысли',
      description: 'Записывай идеи, планы и всё важное — всё в одном месте',
      icon: Icons.note_alt_rounded,
      color: Colors.indigo,
    ),
    OnboardingPage(
      title: 'Задачи под контролем',
      description: 'Ставь цели, отслеживай прогресс и ничего не забывай',
      icon: Icons.checklist_rounded,
      color: Colors.teal,
    ),
    OnboardingPage(
      title: 'Формируй привычки',
      description: 'Маленькие шаги каждый день = большие результаты через год',
      icon: Icons.autorenew_rounded,
      color: Colors.deepPurple,
    ),
    OnboardingPage(
      title: 'Ежедневная рефлексия',
      description: 'Осмысливай день, учись на опыте и расти осознанно',
      icon: Icons.psychology_rounded,
      color: Colors.deepOrange,
    ),
    OnboardingPage(
      title: 'Мотивация каждый день',
      description: 'Цитаты, аффирмации и напоминания о том, зачем ты это делаешь',
      icon: Icons.local_fire_department_rounded,
      color: Color(0xFFF59E0B),
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