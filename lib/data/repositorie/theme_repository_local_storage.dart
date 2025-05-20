

import 'package:flutter/src/material/app.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/data/datasources/theme_local_data_source.dart';
import 'package:todoapp/domain/port/output/theme_repository.dart';

@LazySingleton(as: ThemeRepository, env: [Environment.prod, Environment.dev])
class ThemeRepositoryLocalStorage implements ThemeRepository {
  final ThemeLocalDataSource themeLocalDataSource;

  ThemeRepositoryLocalStorage(this.themeLocalDataSource);

  @override
  Future<ThemeMode> getThemeMode() async {
    return themeLocalDataSource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) {
    return themeLocalDataSource.setThemeMode(mode);
  }
  
}