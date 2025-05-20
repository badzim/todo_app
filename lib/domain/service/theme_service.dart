import 'package:flutter/material.dart';

abstract class ThemeService {
  ThemeMode getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
