import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/repositorie/theme_repository.dart';
import 'package:todoapp/domain/service/theme_service.dart';

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
