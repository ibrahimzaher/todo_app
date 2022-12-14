import 'package:flutter/material.dart';
import 'package:todo_app/shared/network/local/my_shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode;
  ThemeProvider({required this.themeMode});
  toggleTheme(mode) {
    if (themeMode == mode) return;
    themeMode = mode;
    if (mode == ThemeMode.light) {
      MySharedPreferences.setTheme(isDark: false);
    } else {
      MySharedPreferences.setTheme(isDark: true);
    }
    notifyListeners();
  }

  bool isDark() {
    return (themeMode == ThemeMode.dark);
  }
}
