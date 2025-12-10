import 'package:sqflite/sqflite.dart';
import 'package:prack_10/core/models/motivation_item.dart';
import 'package:prack_10/data/dtos/motivation_dto.dart';
import 'package:prack_10/data/mappers/motivation_mapper.dart';
import 'app_database.dart';

/// Data source для хранения мотиваций в SQLite
class MotivationLocalDataSource {
  static const String _tableName = 'motivations';
  static bool _initialized = false;

  /// Инициализация БД с тестовыми данными
  Future<void> initialize() async {
    if (_initialized) return;

    final db = await AppDatabase.instance();
    
    // Проверяем, есть ли уже данные
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $_tableName'),
    ) ?? 0;

    if (count == 0) {
      await _insertTestData(db);
    }

    _initialized = true;
  }

  /// Вставка тестовых данных
  Future<void> _insertTestData(Database db) async {
    final batch = db.batch();

    // Тестовые цитаты
    final testQuotes = [
      {'category': 'Работа', 'text': 'Position yourself to succeed by doing the other things in your life that rejuvenate you. Exhaustion affects your quality and productivity. – Jeff VanderMeer'},
      {'category': 'Работа', 'text': 'A great leader takes people where they don\'t necessarily want to go, but ought to be. – Rosalynn Carter'},
      {'category': 'Работа', 'text': 'Lack of direction, not lack of time, is the problem. We all have twenty-four hour days. – Zig Ziglar'},
      {'category': 'Работа', 'text': 'Schedule your priorities. – Stephen Covey'},
      {'category': 'Работа', 'text': 'When something is important enough, you do it even if the odds are not in your favor. – Elon Musk'},
      {'category': 'Личное', 'text': 'Start by doing what\'s necessary; then do what\'s possible; and suddenly you are doing the impossible. – Francis Of Assisi'},
      {'category': 'Личное', 'text': 'Great things are done by a series of small things brought together. – Vincent Van Gogh'},
      {'category': 'Личное', 'text': 'The way to get started is to quit talking and begin doing. – Walt Disney'},
      {'category': 'Личное', 'text': 'Success is the sum of small efforts, repeated day in and day out. – Robert Collier'},
      {'category': 'Личное', 'text': 'Be the change you want to see in this world. – Gandhi'},
      {'category': 'Учёба', 'text': 'Hard work beats talent when talent doesn\'t work hard. – Tim Notke'},
      {'category': 'Учёба', 'text': 'The more that you read, the more things you will know, the more that you learn, the more places you\'ll go. – Dr. Seuss'},
      {'category': 'Учёба', 'text': 'Learning is a lifelong process. – Unknown'},
      {'category': 'Учёба', 'text': 'It always seems impossible until it\'s done. – Nelson Mandela'},
      {'category': 'Учёба', 'text': 'There is no substitute for hard work. – Thomas Edison'},
      {'category': 'Без категории', 'text': 'Believe you can and youre halfway there. – Theodore Roosevelt'},
      {'category': 'Без категории', 'text': 'Success is not final; failure is not fatal: It is the courage to continue that counts. – Winston Churchill'},
      {'category': 'Без категории', 'text': 'Before anything else, preparation is the key to success. – Alexander Graham Bell'},
    ];

    // Тестовые факты
    final testFacts = [
      {'category': 'Работа', 'text': 'Productivity up 2.4 percent in second quarter 2025. – U.S. Bureau of Labor Statistics'},
      {'category': 'Работа', 'text': 'The average employee is productive for just 2 hours and 53 minutes each day.'},
      {'category': 'Работа', 'text': 'Multitasking can result in a 40% decrease in productivity, greater anxiety, and a 10 points reduction in IQ.'},
      {'category': 'Работа', 'text': 'Flexible scheduling makes employees feel 43% more productive.'},
      {'category': 'Личное', 'text': 'Mondays and Tuesdays are the most productive weekdays.'},
      {'category': 'Личное', 'text': 'We naturally concentrate best in 90-minute intervals, followed by a short break.'},
      {'category': 'Личное', 'text': 'Writing down your goals increases your chances of achieving them by 42%.'},
      {'category': 'Личное', 'text': 'Happy workers are 13% more productive.'},
      {'category': 'Учёба', 'text': 'Productivity peaks around 11 a.m., declines after lunch, and tanks after 3 p.m.'},
      {'category': 'Учёба', 'text': '75% of students procrastinate.'},
      {'category': 'Учёба', 'text': 'Effective time management improves academic performance, with a 53% higher chance of higher grades for students.'},
      {'category': 'Без категории', 'text': 'Sleep is extremely important to productivity; lack of sleep reduces efficiency.'},
      {'category': 'Без категории', 'text': 'Productivity is 2.1% above pre-pandemic levels.'},
    ];

    // Вставляем цитаты
    for (final quote in testQuotes) {
      final item = MotivationItem(
        text: quote['text']!,
        category: quote['category']!,
        type: 'quote',
      );
      final dto = MotivationMapper.toDto(item);
      batch.insert(_tableName, dto.toMap());
    }

    // Вставляем факты
    for (final fact in testFacts) {
      final item = MotivationItem(
        text: fact['text']!,
        category: fact['category']!,
        type: 'fact',
      );
      final dto = MotivationMapper.toDto(item);
      batch.insert(_tableName, dto.toMap());
    }

    await batch.commit(noResult: true);
  }

  /// Получить все цитаты, сгруппированные по категориям
  Future<Map<String, List<String>>> getQuotes() async {
    await initialize();
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'type = ?',
      whereArgs: ['quote'],
    );

    final Map<String, List<String>> result = {};
    for (final map in maps) {
      final dto = MotivationDto.fromMap(map);
      final category = dto.category;
      if (!result.containsKey(category)) {
        result[category] = [];
      }
      result[category]!.add(dto.text);
    }

    return result;
  }

  /// Получить все факты, сгруппированные по категориям
  Future<Map<String, List<String>>> getFacts() async {
    await initialize();
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'type = ?',
      whereArgs: ['fact'],
    );

    final Map<String, List<String>> result = {};
    for (final map in maps) {
      final dto = MotivationDto.fromMap(map);
      final category = dto.category;
      if (!result.containsKey(category)) {
        result[category] = [];
      }
      result[category]!.add(dto.text);
    }

    return result;
  }

  /// Получить цитаты по категории
  Future<List<String>> getQuotesByCategory(String category) async {
    await initialize();
    final db = await AppDatabase.instance();
    
    if (category == 'Все категории') {
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'type = ?',
        whereArgs: ['quote'],
      );
      return maps.map((map) => MotivationDto.fromMap(map).text).toList();
    }

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'type = ? AND category = ?',
      whereArgs: ['quote', category],
    );

    if (maps.isEmpty && category != 'Без категории') {
      // Если категория не найдена, возвращаем из "Без категории"
      return getQuotesByCategory('Без категории');
    }

    return maps.map((map) => MotivationDto.fromMap(map).text).toList();
  }

  /// Получить факты по категории
  Future<List<String>> getFactsByCategory(String category) async {
    await initialize();
    final db = await AppDatabase.instance();
    
    if (category == 'Все категории') {
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'type = ?',
        whereArgs: ['fact'],
      );
      return maps.map((map) => MotivationDto.fromMap(map).text).toList();
    }

    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'type = ? AND category = ?',
      whereArgs: ['fact', category],
    );

    if (maps.isEmpty && category != 'Без категории') {
      // Если категория не найдена, возвращаем из "Без категории"
      return getFactsByCategory('Без категории');
    }

    return maps.map((map) => MotivationDto.fromMap(map).text).toList();
  }

  /// Получить список всех категорий
  Future<List<String>> getCategories() async {
    await initialize();
    final db = await AppDatabase.instance();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      columns: ['category'],
      distinct: true,
    );

    final categories = maps.map((map) => map['category'] as String).toSet().toList();
    return ['Все категории', ...categories];
  }

  /// Добавить новый элемент мотивации
  Future<void> addMotivationItem(MotivationItem item) async {
    await initialize();
    final db = await AppDatabase.instance();
    final dto = MotivationMapper.toDto(item);
    await db.insert(_tableName, dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Удалить элемент мотивации
  Future<void> deleteMotivationItem(String id) async {
    final db = await AppDatabase.instance();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
