import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/service/theme_service.dart';

@injectable
class ThemeController extends ChangeNotifier {
  final ThemeService _themeService;

  ThemeMode _current = ThemeMode.system;
  ThemeMode get current => _current;

  ThemeController(this._themeService);

  /// Appelée manuellement après injection
  Future<void> load() async {
    _current = await _themeService.getThemeMode();
    notifyListeners();
  }

  Future<void> setTheme(ThemeMode mode) async {
    await _themeService.setThemeMode(mode);
    _current = mode;
    notifyListeners();
  }
}
