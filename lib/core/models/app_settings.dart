class AppSettings {
  final bool isDarkMode;
  final String languageCode; // Храним код языка вместо Locale

  const AppSettings({
    required this.isDarkMode,
    required this.languageCode,
  });

  AppSettings copyWith({
    bool? isDarkMode,
    String? languageCode,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'languageCode': languageCode,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      isDarkMode: json['isDarkMode'] ?? false,
      languageCode: json['languageCode'] ?? 'ru',
    );
  }
}
