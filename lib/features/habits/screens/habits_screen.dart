// screens/habits_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../models/habit.dart';
import '../state/habits_store.dart';
class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final store = HabitsStore();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.home), onPressed: () => context.push('/')),],
        title: const Text('Трекер привычек'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/habits/add'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: store.setSearchQuery,
              decoration: InputDecoration(
                hintText: 'Поиск по названию...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                final habits = store.filteredHabits;
                if (habits.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 80, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Нет привычек', style: TextStyle(fontSize: 20, color: Colors.grey)),
                        Text('Нажмите + чтобы создать первую', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: habits.length,
                  itemBuilder: (context, index) {
                    final habit = habits[index];
                    return HabitCard(habit: habit);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class HabitCard extends StatelessWidget {
  final Habit habit;
  const HabitCard({super.key, required this.habit});
  @override
  Widget build(BuildContext context) {
    final store = HabitsStore();
    return Observer(
      builder: (_) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => context.push(
            '/habits/${habit.id}',
            extra: habit,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: habit.color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Text(habit.icon, style: const TextStyle(fontSize: 32)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(habit.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.local_fire_department,
                              color: habit.currentStreak > 0 ? Colors.orange : Colors.grey[600],
                              size: 22),
                          const SizedBox(width: 6),
                          Text('${habit.currentStreak} дн.', style: const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(width: 16),
                          const Icon(Icons.emoji_events, color: Colors.amber, size: 22),
                          const SizedBox(width: 6),
                          Text('${habit.bestStreak} рекорд'),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: habit.toggleToday,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: habit.isDoneToday ? habit.color : Colors.grey[350],
                        ),
                        child: Icon(
                          habit.isDoneToday ? Icons.check : Icons.add,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Удалить привычку?'),
                            content: Text('Вы уверены, что хотите удалить "${habit.title}"?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Отмена'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Удалить', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true) {
                          store.deleteHabit(habit.id);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}