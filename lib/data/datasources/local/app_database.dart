// app_database.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Единый провайдер базы данных SQLite для приложения
class AppDatabase {
  static Database? _db;
  static const int _version = 3; // Увеличиваем версию для добавления таблицы мотиваций

  /// Получить экземпляр базы данных (singleton)
  static Future<Database> instance() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    _db = await openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return _db!;
  }

  /// Создание всех таблиц при первом запуске
  static Future<void> _onCreate(Database db, int version) async {
    // Таблица заметок
    await db.execute('''
      CREATE TABLE notes(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        category TEXT NOT NULL,
        creationDate INTEGER NOT NULL,
        isFavorite INTEGER NOT NULL DEFAULT 0,
        isArchived INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Таблица задач
    await db.execute('''
      CREATE TABLE tasks(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        category TEXT NOT NULL,
        deadline INTEGER NOT NULL,
        itemsJson TEXT NOT NULL
      )
    ''');

    // Таблица рефлексий
    await db.execute('''
      CREATE TABLE reflections(
        id TEXT PRIMARY KEY,
        creationDate INTEGER NOT NULL,
        answersJson TEXT NOT NULL,
        additionalNotes TEXT
      )
    ''');

    // Таблица привычек
    await db.execute('''
      CREATE TABLE habits(
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        icon TEXT NOT NULL,
        colorValue INTEGER NOT NULL,
        completionsJson TEXT NOT NULL,
        createdAt INTEGER NOT NULL
      )
    ''');

    // Таблица мотиваций
    await db.execute('''
      CREATE TABLE motivations(
        id TEXT PRIMARY KEY,
        text TEXT NOT NULL,
        category TEXT NOT NULL,
        type TEXT NOT NULL
      )
    ''');
  }

  /// Обновление схемы базы данных при изменении версии
  static Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Добавляем таблицу привычек, если её нет
      await db.execute('''
        CREATE TABLE IF NOT EXISTS habits(
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL,
          icon TEXT NOT NULL,
          colorValue INTEGER NOT NULL,
          completionsJson TEXT NOT NULL,
          createdAt INTEGER NOT NULL
        )
      ''');
    }
    if (oldVersion < 3) {
      // Добавляем таблицу мотиваций, если её нет
      await db.execute('''
        CREATE TABLE IF NOT EXISTS motivations(
          id TEXT PRIMARY KEY,
          text TEXT NOT NULL,
          category TEXT NOT NULL,
          type TEXT NOT NULL
        )
      ''');
    }
  }

  /// Закрыть соединение с базой данных
  static Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}
