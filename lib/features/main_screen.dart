// screens/main_menu_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Заголовок
                  Text(
                    'Твой путь к лучшей версии себя',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Заметки • Задачи • Привычки • Рефлексия • Мотивация',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 50),

                  // Сетка карточек
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: [
                        _buildMenuTile(
                          context: context,
                          title: 'Заметки',
                          icon: Icons.note_alt_rounded,
                          color: Colors.indigo,
                          onTap: () => context.go('/notes'),
                        ),
                        _buildMenuTile(
                          context: context,
                          title: 'Задачи',
                          icon: Icons.checklist_rounded,
                          color: Colors.teal,
                          onTap: () => context.go('/tasks'),
                        ),
                        _buildMenuTile(
                          context: context,
                          title: 'Привычки',
                          icon: Icons.autorenew_rounded,
                          color: Colors.deepPurple,
                          onTap: () => context.go('/habits'),
                        ),
                        _buildMenuTile(
                          context: context,
                          title: 'Рефлексия',
                          icon: Icons.psychology_rounded,
                          color: Colors.deepOrange,
                          onTap: () => context.go('/reflections'),
                        ),
                        _buildMenuTile(
                          context: context,
                          title: 'Мотивация',
                          icon: Icons.auto_awesome_rounded,
                          color: Colors.amber.shade700,
                          onTap: () => context.go('/motivation'),
                        ),
                        _buildMenuTile(
                          context: context,
                          title: 'Настройки',
                          icon: Icons.settings_rounded,
                          color: Colors.grey.shade700,
                          onTap: () => context.push('/settings'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'v1.0 • Всё под контролем',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        splashColor: color.withOpacity(0.25),
        highlightColor: color.withOpacity(0.15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color.withOpacity(0.12),
            border: Border.all(color: color.withOpacity(0.3), width: 1.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: color.darken(0.3),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension ColorUtils on Color {
  Color darken([double amount = 0.2]) {
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}