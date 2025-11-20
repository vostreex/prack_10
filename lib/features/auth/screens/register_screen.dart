// features/auth/presentation/register/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../state/register_store.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterStore store = RegisterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                'Создать аккаунт',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Заполните данные для регистрации',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // ИМЯ
              Observer(builder: (_) {
                return TextField(
                  onChanged: store.setName,
                  decoration: InputDecoration(
                    labelText: 'Имя',
                    prefixIcon: const Icon(Icons.person_outline),
                    errorText: store.name.trim().isNotEmpty && store.name.trim().length < 2
                        ? 'Имя должно быть не менее 2 символов'
                        : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                );
              }),
              const SizedBox(height: 16),

              // EMAIL
              Observer(builder: (_) {
                return TextField(
                  onChanged: store.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorText: store.email.isNotEmpty && !store.email.contains('@')
                        ? 'Введите корректный email (обязательно @)'
                        : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                );
              }),
              const SizedBox(height: 16),

              // ПАРОЛЬ
              TextField(
                onChanged: store.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 16),

              // ПОДТВЕРЖДЕНИЕ ПАРОЛЯ
              Observer(builder: (_) {
                return TextField(
                  onChanged: store.setConfirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Подтвердите пароль',
                    prefixIcon: const Icon(Icons.lock_outline),
                    errorText: store.confirmPassword.isNotEmpty && !store.passwordsMatch
                        ? 'Пароли не совпадают'
                        : null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                );
              }),

              const SizedBox(height: 32),

              // КНОПКА — активна ТОЛЬКО при полной валидности
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: store.canSubmit
                      ? () async {
                    final success = await store.register();
                    if (!success || !context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Регистрация успешна! Теперь вы можете войти'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );

                    context.go('/login');
                  }
                      : null, // null = кнопка отключена
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: store.isLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                      : const Text('Зарегистрироваться', style: TextStyle(fontSize: 18)),
                );
              }),

              const SizedBox(height: 16),

              Observer(
                builder: (_) => store.hasError
                    ? Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Colors.red[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(store.errorMessage!, style: const TextStyle(color: Colors.red)),
                )
                    : const SizedBox.shrink(),
              ),

              const Spacer(flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Уже есть аккаунт? '),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('Войти', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}