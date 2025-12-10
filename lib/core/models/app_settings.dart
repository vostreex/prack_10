class AppSettings {
  final bool isDarkMode;
  final String languageCode; // Храним код языка вместо Locale
  final bool onboardingCompleted;

  const AppSettings({
    required this.isDarkMode,
    required this.languageCode,
    this.onboardingCompleted = false,
  });

  AppSettings copyWith({
    bool? isDarkMode,
    String? languageCode,
    bool? onboardingCompleted,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'languageCode': languageCode,
      'onboardingCompleted': onboardingCompleted,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      isDarkMode: json['isDarkMode'] ?? false,
      languageCode: json['languageCode'] ?? 'ru',
      onboardingCompleted: json['onboardingCompleted'] ?? false,
    );
  }
}
