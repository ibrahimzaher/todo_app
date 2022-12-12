import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  toggleTheme(mode) {
    if (themeMode == mode) return;
    themeMode = mode;
    notifyListeners();
  }

  bool isDark() {
    return (themeMode == ThemeMode.dark);
  }
}
