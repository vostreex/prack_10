// screens/motivation_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // или твой DI (GetIt, etc.)
import 'package:share_plus/share_plus.dart';
import '../state/motivation_store.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    late final MotivationStore store = MotivationStore()..refreshAll();

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
            // Категория
            const Text('Категория:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: store.selectedCategory,
              isExpanded: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: ['Все категории', 'Работа', 'Личное', 'Учёба', 'Без категории']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => v != null ? store.setCategory(v) : null,
            ),

            const SizedBox(height: 32),

            // Цитата дня
            _buildCard(
              title: "Цитата дня",
              content: store.currentQuote ?? "Нет цитат в этой категории",
              onShare: () => Share.share(store.currentQuote ?? ''),
              onRefresh: store.nextQuote,
            ),

            const SizedBox(height: 24),

            // Факт о продуктивности
            _buildCard(
              title: "Факт о продуктивности",
              content: store.currentFact ?? "Нет фактов в этой категории",
              onShare: () => Share.share(store.currentFact ?? ''),
              onRefresh: store.nextFact,
              isFact: true,
            ),

            const SizedBox(height: 40),

            // Большая кнопка обновления
            ElevatedButton.icon(
              onPressed: store.refreshAll,
              icon: const Icon(Icons.refresh),
              label: const Text('Новая порция мотивации!', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(height: 32),

            // Советы (статичные)
            const Text('Полезные советы:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              '• Помодоро: 25 минут работы → 5 минут отдыха\n'
                  '• Утро — самое продуктивное время для сложных задач\n'
                  '• Записывайте цели — это повышает шанс успеха на 42%\n'
                  '• Растения в комнате повышают продуктивность\n'
                  '• Меньше multitasking — больше результата',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String content,
    required VoidCallback onShare,
    required VoidCallback onRefresh,
    bool isFact = false,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 16),
            Text(
              content,
              style: TextStyle(
                fontSize: 18,
                fontStyle: isFact ? FontStyle.normal : FontStyle.italic,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh, size: 28),
                  tooltip: 'Новая ${isFact ? 'факт' : 'цитата'}',
                  onPressed: onRefresh,
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const Icon(Icons.share, size: 28),
                  tooltip: 'Поделиться',
                  onPressed: onShare,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}