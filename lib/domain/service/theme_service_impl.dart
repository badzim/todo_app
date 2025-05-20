import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/port/input/theme_service.dart';
import 'package:todoapp/domain/port/output/theme_repository.dart';

@LazySingleton(as: ThemeService, env: [Environment.prod, Environment.dev])
class ThemeServiceImpl implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl(this.themeRepository);

  @override
  Future<ThemeMode> getThemeMode() {
    return themeRepository.getThemeMode();
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    return themeRepository.setThemeMode(mode);
  }

}
