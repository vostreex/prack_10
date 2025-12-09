// shared/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Светлая тема — идеально
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
  );

  // Тёмная тема — теперь красиво и правильно!
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, // ← Тот же цвет, что и в светлой — это правильно!
      brightness: Brightness.dark, // ← Flutter сам сделает тёмные оттенки
    ),
  );
}