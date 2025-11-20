// screens/habit_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import '../models/habit.dart';
import '../state/habit_details_store.dart';
class HabitDetailsScreen extends StatelessWidget {
  final Habit habit;
  const HabitDetailsScreen({super.key, required this.habit});
  @override
  Widget build(BuildContext context) {
    final store = HabitDetailsStore(habit);
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 29));
    final days = List.generate(30, (i) => startDate.add(Duration(days: i)));
    return Scaffold(
      appBar: AppBar(
        title: Text(habit.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              // Удаляем из глобального списка
              store.deleteHabit(habit.id);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(child: Text(habit.icon, style: const TextStyle(fontSize: 80))),
            const SizedBox(height: 16),
            Center(
              child: Text(habit.title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 32),
            // Статистика
            Row(children: [
              Expanded(child: _statCard('Цепочка', '${habit.currentStreak}', 'дней', Icons.local_fire_department, Colors.orange)),
              Expanded(child: _statCard('Рекорд', '${habit.bestStreak}', 'дней', Icons.emoji_events, Colors.amber.shade700)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _statCard('Выполнено', '${habit.totalCompletedDays}', 'раз', Icons.check_circle, Colors.green)),
              Expanded(child: _statCard('Успешность', '${_successRate(habit)}%', 'всего', Icons.trending_up, Colors.blue)),
            ]),
            const SizedBox(height: 32),
            const Text('Последние 30 дней', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                final date = days[index];
                final key = DateTime(date.year, date.month, date.day);
                final isToday = key.year == now.year && key.month == now.month && key.day == now.day;
                final isDone = habit.completions[key] == true;
                return GestureDetector(
                  onTap: () => store.toggleDate(date),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isDone ? habit.color : (isToday ? habit.color.withOpacity(0.15) : Colors.grey[100]),
                      borderRadius: BorderRadius.circular(14),
                      border: isToday ? Border.all(color: habit.color, width: 2.5) : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${date.day}',
                              style: TextStyle(
                                fontWeight: isToday ? FontWeight.bold : FontWeight.w600,
                                color: isDone ? Colors.white : (isToday ? habit.color : null),
                              )),
                          if (isDone) const Icon(Icons.check, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(),
            Text(
              'Создано ${DateFormat('d MMMM yyyy').format(habit.createdAt)}',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  Widget _statCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 10),
            Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
            Text(subtitle, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
          ],
        ),
      ),
    );
  }
  String _successRate(Habit habit) {
    final days = DateTime.now().difference(habit.createdAt).inDays + 1;
    if (days <= 0) return '0';
    return ((habit.totalCompletedDays / days) * 100).clamp(0, 100).toStringAsFixed(0);
  }
}