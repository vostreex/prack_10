// features/auth/presentation/login/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../state/login_store.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Добро пожаловать!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Войдите в свой аккаунт',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),

              // EMAIL с подсказкой
              Observer(builder: (_) {
                return TextField(
                  onChanged: store.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@mail.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorText: store.email.isNotEmpty && !store.email.contains('@')
                        ? 'Введите корректный email'
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
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Забыли пароль?')),
              ),

              const SizedBox(height: 24),

              // КНОПКА — активна только при валидных данных
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: store.canSubmit
                      ? () async {
                    final success = await store.login();
                    if (success && context.mounted) {
                      context.go('/');
                    }
                  }
                      : null,
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
                      : const Text('Войти', style: TextStyle(fontSize: 18)),
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

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Нет аккаунта? '),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: const Text('Зарегистрироваться', style: TextStyle(fontWeight: FontWeight.bold)),
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