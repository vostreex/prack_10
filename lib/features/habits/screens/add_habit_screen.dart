// screens/add_habit_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../state/add_habit_store.dart';
import '../models/habit.dart';

class AddHabitScreen extends StatelessWidget {
  const AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final store = AddHabitStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая привычка'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Поле ввода названия — напрямую пишем в store
          Observer(
            builder: (_) => TextField(
              onChanged: store.setTitle,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: 'Название привычки',
                hintText: 'Пить воду, Читать 30 минут, Медитация',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                prefixIcon: const Icon(Icons.edit),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Большой выбранный эмодзи
          Observer(
            builder: (_) => Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: store.selectedColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  store.selectedEmoji,
                  style: const TextStyle(fontSize: 64),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
          const Text('Выберите эмодзи', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Observer(
            builder: (_) {
              final selectedEmoji = store.selectedEmoji;
              final selectedColor = store.selectedColor;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: store.availableEmojis.length,
                itemBuilder: (context, i) {
                  final emoji = store.availableEmojis[i];
                  final isSelected = emoji == selectedEmoji;

                  return GestureDetector(
                    onTap: () => store.setEmoji(emoji),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected ? selectedColor.withOpacity(0.2) : Colors.grey[100],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? selectedColor : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(emoji, style: const TextStyle(fontSize: 32)),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 32),
          const Text('Выберите цвет', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          // Палитра цветов
          Observer(
            builder: (_) => Wrap(
              spacing: 16,
              runSpacing: 12,
              children: store.availableColors.map((color) {
                final isSelected = color == store.selectedColor;
                return GestureDetector(
                  onTap: () => store.setColor(color),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isSelected ? 0.3 : 0.15),
                          blurRadius: isSelected ? 12 : 6,
                        ),
                      ],
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 32)
                        : null,
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 40),

          // Кнопка создания
          Observer(
            builder: (_) => ElevatedButton(
              onPressed: store.canCreate
                  ? () {
                final habit = Habit(
                  title: store.title.trim(),
                  icon: store.selectedEmoji,
                  color: store.selectedColor,
                );
                store.addHabit(habit);
                context.pop();
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Создать привычку',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}