import 'package:flutter/material.dart';
import 'package:flutter_academy/infrastructure/res/theme_mode.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeVM extends ChangeNotifier {
  ThemeModeService _themeModeService;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeModeVM(this._themeModeService) {
    loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> loadThemeMode() async {
    final darkTheme = await _themeModeService.isDarkMode();
    _themeMode = darkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleThemeMode() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeModeService.saveThemeMode(themeMode == ThemeMode.dark);
    notifyListeners();
  }
}

final themeModeProvider =
    ChangeNotifierProvider((_) => ThemeModeVM(ThemeModeService.instance));
