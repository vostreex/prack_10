// screens/motivation_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import '../state/motivation_store.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  final _searchController = TextEditingController();
  final _authorController = TextEditingController();
  late final MotivationStore store;

  @override
  void initState() {
    super.initState();
    store = GetIt.I<MotivationStore>();

    _searchController.addListener(() => setState(() {}));
    _authorController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мотивация и вдохновение'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
      ),
      body: Observer(
        builder: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // -----------------------------
            // Поиск цитат
            // -----------------------------
            const Text('Поиск цитат:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Введите ключевое слово для поиска',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          store.search('');
                        },
                      )
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                ElevatedButton.icon(
                  onPressed: _searchController.text.isEmpty
                      ? null
                      : () => store.search(_searchController.text),
                  icon: store.isSearchLoading
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Icon(Icons.search),
                  label: const Text('Найти'),
                ),
              ],
            ),

            // --- Карточка поиска (сразу под поиском)
            Observer(builder: (_) {
              if (store.searchQuery != null &&
                  store.searchQuery!.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    _buildCard(
                      title: "Результаты поиска",
                      content:
                      store.currentSearchQuote ?? "Нет результатов",
                      onShare: () => Share.share(
                          store.currentSearchQuote ?? ''),
                      onRefresh: store.nextSearchQuote,
                      isLoading: store.isSearchLoading,
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),

            // -----------------------------
            // Фильтр по автору
            // -----------------------------
            const Text('Фильтр по автору:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      hintText: 'Введите имя автора',
                      prefixIcon: const Icon(Icons.person),
                      suffixIcon: _authorController.text.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _authorController.clear();
                          store.filterByAuthor('');
                        },
                      )
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                ElevatedButton.icon(
                  onPressed: _authorController.text.isEmpty
                      ? null
                      : () => store.filterByAuthor(_authorController.text),
                  icon: store.isAuthorLoading
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Icon(Icons.person),
                  label: const Text('Найти'),
                ),
              ],
            ),

            // --- Карточка автора (сразу под полем)
            Observer(builder: (_) {
              if (store.authorFilter != null &&
                  store.authorFilter!.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    _buildCard(
                      title: "Цитаты автора: ${store.authorFilter}",
                      content:
                      store.currentAuthorQuote ?? "Нет результатов",
                      onShare: () =>
                          Share.share(store.currentAuthorQuote ?? ''),
                      onRefresh: store.nextAuthorQuote,
                      isLoading: store.isAuthorLoading,
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),

            // -----------------------------
            // Категория
            // -----------------------------
            const Text('Категория:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),

            Observer(
              builder: (_) => DropdownButtonFormField<String>(
                value: store.selectedCategory,
                isExpanded: true,
                decoration:
                const InputDecoration(border: OutlineInputBorder()),
                items: store.categories
                    .map((c) =>
                    DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) =>
                v != null ? store.setCategory(v) : null,
              ),
            ),

            const SizedBox(height: 24),

            // -----------------------------
            // Цитата дня
            // -----------------------------
            Observer(
              builder: (_) => _buildQuoteOfTheDayCard(
                title: "Цитата дня",
                content: store.quoteOfTheDay ?? "Загрузка...",
                onShare: () =>
                    Share.share(store.quoteOfTheDay ?? ''),
                isLoading: store.isQuoteOfTheDayLoading,
              ),
            ),

            const SizedBox(height: 24),

            // -----------------------------
            // Категория (сразу под цитатой дня)
            // -----------------------------
            Observer(
              builder: (_) => _buildCard(
                title: "Цитата из категории: ${store.selectedCategory}",
                content:
                store.currentCategoryQuote ?? "Нет цитат",
                onShare: () =>
                    Share.share(store.currentCategoryQuote ?? ''),
                onRefresh: store.nextCategoryQuote,
                isLoading: store.isCategoryLoading,
              ),
            ),

            const SizedBox(height: 24),

            // -----------------------------
            // Случайная цитата
            // -----------------------------
            Observer(
              builder: (_) => _buildCard(
                title: "Случайная цитата",
                content: store.randomQuote ?? "Загрузка...",
                onShare: () =>
                    Share.share(store.randomQuote ?? ''),
                onRefresh: store.loadRandomQuote,
                isLoading: store.isRandomLoading,
              ),
            ),

            const SizedBox(height: 24),

            // -----------------------------
            // Факт
            // -----------------------------
            Observer(
              builder: (_) => _buildCard(
                title: "Факт о продуктивности",
                content:
                store.currentFact ?? "Нет фактов",
                onShare: () =>
                    Share.share(store.currentFact ?? ''),
                onRefresh: store.nextFact,
                isFact: true,
                isLoading: store.isFactLoading,
              ),
            ),

            const SizedBox(height: 40),

            // -----------------------------
            // Общая кнопка
            // -----------------------------
            ElevatedButton.icon(
              onPressed: () => store.refreshAll(),
              icon: const Icon(Icons.refresh),
              label: const Text('Новая порция мотивации!',
                  style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------
  // Виджеты карточек
  // -----------------------------------------

  Widget _buildQuoteOfTheDayCard({
    required String title,
    required String content,
    required VoidCallback onShare,
    required bool isLoading,
  }) {
    return _buildStyledCard(
      title: title,
      content: content,
      onShare: onShare,
      isItalic: true,
      isLoading: isLoading,
    );
  }

  Widget _buildCard({
    required String title,
    required String content,
    required VoidCallback onShare,
    required VoidCallback onRefresh,
    required bool isLoading,
    bool isFact = false,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            const SizedBox(height: 16),
            isLoading
                ? const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            )
                : Text(
              content,
              style: TextStyle(
                fontSize: 18,
                fontStyle:
                isFact ? FontStyle.normal : FontStyle.italic,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            if (!isLoading) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh, size: 28),
                  onPressed: onRefresh,
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const Icon(Icons.share, size: 28),
                  onPressed: onShare,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledCard({
    required String title,
    required String content,
    required VoidCallback onShare,
    required bool isLoading,
    bool isItalic = false,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            const SizedBox(height: 16),

            isLoading
                ? const CircularProgressIndicator()
                : Text(
              content,
              style: TextStyle(
                fontSize: 18,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            if (!isLoading)
              IconButton(
                icon: const Icon(Icons.share, size: 28),
                onPressed: onShare,
              )
          ],
        ),
      ),
    );
  }
}
