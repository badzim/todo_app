import 'package:flutter/material.dart';

abstract class ThemeService {
  Future<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
