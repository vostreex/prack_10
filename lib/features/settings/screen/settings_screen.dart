// features/settings/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/features/settings/state/settings_store.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsStore store = GetIt.I<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.blue),
              title: const Text(
                'Мой профиль',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/profile');
              },
            ),
          ),

          const SizedBox(height: 32),

          const Text('  Приложение', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),

          Observer(
            builder: (_) => ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: const Text('Темный режим'),
              trailing: Switch(
                value: store.isDarkMode,
                onChanged: (_) => store.toggleDarkMode(),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Язык'),
            trailing: Observer(
              builder: (_) => DropdownButton<String>(
                value: store.locale.languageCode,
                underline: const SizedBox(), // убираем подчёркивание
                icon: const Icon(Icons.arrow_drop_down),
                items: const [
                  DropdownMenuItem(value: 'ru', child: Text('Русский')),
                  DropdownMenuItem(value: 'en', child: Text('English')),
                ],
                onChanged: (String? newLang) {
                  if (newLang != null) {
                    store.setLanguage(newLang);
                  }
                },
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('О приложении'),
            onTap: () => _showAboutDialog(context),
          ),

          const SizedBox(height: 40),

          Center(
            child: Text(
              'Версия 1.0 • Всё под контролем',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Твой путь',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.auto_awesome, size: 50),
      children: const [
        Text('Приложение для саморазвития и осознанности.'),
      ],
    );
  }
}