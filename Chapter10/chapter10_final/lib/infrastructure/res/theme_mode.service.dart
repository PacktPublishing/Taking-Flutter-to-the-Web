import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeService {
  static ThemeModeService? _instance;

  ThemeModeService._();

  static ThemeModeService get instance {
    if (_instance == null) {
      _instance = ThemeModeService._();
    }
    return _instance!;
  }

  Future<bool> saveThemeMode(bool darkMode) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("darkMode", darkMode);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isDarkMode() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool("darkMode") ?? false;
    } catch (e) {
      return false;
    }
  }
}
