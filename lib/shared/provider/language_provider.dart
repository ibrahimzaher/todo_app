import 'package:flutter/material.dart';
import 'package:todo_app/shared/network/local/my_shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String language;
  LanguageProvider({required this.language});
  toggleLanguage(String lang) {
    if (language == lang) return;
    language = lang;
    MySharedPreferences.setLanguage(lang: lang);
    notifyListeners();
  }
}
