import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  static Future<bool> setTheme({required bool isDark}) {
    return sharedPreferences.setBool('Theme', isDark);
  }

  static bool? getTheme() {
    return sharedPreferences.getBool('Theme');
  }

  static Future<bool> setLanguage({required String lang}) {
    return sharedPreferences.setString('Language', lang);
  }

  static String? getLanguage() {
    return sharedPreferences.getString('Language');
  }
}
