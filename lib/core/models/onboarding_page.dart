class OnboardingPage {
  final String title;
  final String description;
  final int iconCodePoint; // Храним код иконки вместо IconData
  final int colorValue; // Храним как int вместо Color

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.iconCodePoint,
    required this.colorValue,
  });
}
