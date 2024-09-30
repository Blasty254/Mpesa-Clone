import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  // Toggle between light, dark, and system themes
  void toggleTheme(bool isDarkMode) {
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  // Set system theme
  void useSystemTheme() {
    state = ThemeMode.system;
  }
}