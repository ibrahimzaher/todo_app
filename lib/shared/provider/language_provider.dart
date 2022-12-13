import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = 'Arabic';
  toggleLanguage(String lang) {
    if (language == lang) return;
    language = lang;
    notifyListeners();
  }
}
