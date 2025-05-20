import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/domain/service/theme_service.dart';

class ThemeServiceImpl implements ThemeService {
  static const String _boxName = 'settings';
  static const String _key = 'theme_mode';

  @override
  ThemeMode getThemeMode() {
    final box = Hive.box(_boxName);
    final stored = box.get(_key, defaultValue: 'system');
    return _stringToThemeMode(stored);
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    final box = Hive.box(_boxName);
    await box.put(_key, mode.name); // mode.name = 'light', 'dark', etc.
  }

  ThemeMode _stringToThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
