// features/onboarding/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/features/onboarding/state/onboarding_store.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingStore store = OnboardingStore();
  final PageController _pageController = PageController();

  void _completeOnboarding(BuildContext context) {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            // Основной контент
            PageView.builder(
              controller: _pageController,
              onPageChanged: store.setPage,
              itemCount: store.pages.length,
              itemBuilder: (context, index) {
                final page = store.pages[index];
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: page.color.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(page.icon, size: 100, color: page.color),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        page.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        page.description,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                );
              },
            ),

            // Кнопка "Пропустить" — в правом верхнем углу
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () => _completeOnboarding(context),
                child: const Text(
                  'Пропустить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Индикаторы страниц
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    store.pages.length,
                        (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: store.currentPage == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: store.currentPage == i
                            ? colorScheme.primary
                            : colorScheme.primary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Нижняя панель с "Назад" и "Далее / Начать!"
            Positioned(
              bottom: 40,
              left: 32,
              right: 32,
              child: Observer(
                builder: (_) => Row(
                  children: [
                    // Кнопка "Назад"
                    if (store.currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('Назад'),
                      )
                    else
                      const SizedBox(width: 60),

                    const Spacer(),

                    // Кнопка "Далее" или "Начать!"
                    ElevatedButton(
                      onPressed: () {
                        if (store.isLastPage) {
                          _completeOnboarding(context);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        store.isLastPage ? 'Начать!' : 'Далее',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}