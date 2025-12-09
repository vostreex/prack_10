// features/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';


import '../state/profile_store.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileStore store = ProfileStore();

  // Диалог смены пароля
  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Сменить пароль'),
        content: Observer(
          builder: (_) => SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  obscureText: !store.isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Новый пароль',
                    border: const OutlineInputBorder(),
                    errorText: store.newPassword.isNotEmpty && store.newPassword.length < 6
                        ? 'Минимум 6 символов'
                        : null,
                  ),
                  onChanged: store.setNewPassword,
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: !store.isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Подтвердите пароль',
                    border: const OutlineInputBorder(),
                    errorText: store.confirmPassword.isNotEmpty && store.newPassword != store.confirmPassword
                        ? 'Пароли не совпадают'
                        : null,
                  ),
                  onChanged: store.setConfirmPassword,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Показать пароль'),
                    const Spacer(),
                    Switch(
                      value: store.isPasswordVisible,
                      onChanged: (_) => store.togglePasswordVisibility(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          Observer(
            builder: (_) => ElevatedButton(
              onPressed: store.canSavePassword
                  ? () {
                store.changePassword();
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Пароль успешно изменён'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
                  : null,
              child: const Text('Сохранить'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Observer(
        builder: (_) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Карточка профиля
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundColor: colorScheme.primary.withOpacity(0.15),
                  child: Text(
                    store.initials,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                title: Text(
                  store.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(store.userEmail),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // В будущем — редактирование профиля
                },
              ),
            ),

            const SizedBox(height: 32),

            const Text('  Аккаунт', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),

            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.blue),
              title: const Text('Имя пользователя'),
              subtitle: Text(store.userName),
            ),

            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.green),
              title: const Text('Email'),
              subtitle: Text(store.userEmail),
            ),

            const Divider(height: 40),

            const Text('  Безопасность', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),

            ListTile(
              leading: const Icon(Icons.lock_outline, color: Colors.deepOrange),
              title: const Text('Сменить пароль'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showChangePasswordDialog(context),
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
      ),
    );
  }
}