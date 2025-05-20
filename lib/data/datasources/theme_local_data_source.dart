

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class ThemeLocalDataSource {
  static const String _boxName = 'settings';
  static const String _key = 'theme_mode';

  Future<ThemeMode> getThemeMode() async {
    final box = await _openBox();
    final stored = box.get(_key, defaultValue: 'system');
    return _stringToThemeMode(stored);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final box = await _openBox();
    await box.put(_key, mode.name);
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

  Future<Box<String>> _openBox() async {
    return await Hive.openBox<String>(_boxName);
  }
}