import 'package:flutter/material.dart';
import 'onboarding_page.dart';

extension OnboardingPageExtensions on OnboardingPage {
  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  Color get color => Color(colorValue);
}

