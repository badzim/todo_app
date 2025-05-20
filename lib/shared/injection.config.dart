// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasources/task_local_data_source.dart' as _i135;
import '../data/datasources/theme_local_data_source.dart' as _i918;
import '../data/repositorie/task_repository_in_memory.dart' as _i601;
import '../data/repositorie/task_repository_local_storage.dart' as _i3;
import '../data/repositorie/theme_repository_local_storage.dart' as _i927;
import '../domain/port/input/notification_service.dart' as _i849;
import '../domain/port/input/task_service.dart' as _i67;
import '../domain/port/input/theme_service.dart' as _i1067;
import '../domain/port/output/task_repository.dart' as _i300;
import '../domain/port/output/theme_repository.dart' as _i328;
import '../domain/service/notification_service_impl.dart' as _i967;
import '../domain/service/task_service_impl.dart' as _i861;
import '../domain/service/theme_service_impl.dart' as _i736;
import '../presentation/controller/language_controller.dart' as _i545;
import '../presentation/controller/task_controller.dart' as _i645;
import '../presentation/controller/theme_controller.dart' as _i892;

const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i545.LanguageController>(() => _i545.LanguageController());
    gh.lazySingleton<_i849.NotificationService>(
      () => _i967.NotificationServiceImpl(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i300.TaskRepository>(
      () => _i601.TaskRepositoryInMemory(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i918.ThemeLocalDataSource>(
      () => _i918.ThemeLocalDataSource(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i135.TaskLocalDataSource>(
      () => _i135.TaskLocalDataSource(),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i328.ThemeRepository>(
      () => _i927.ThemeRepositoryLocalStorage(gh<_i918.ThemeLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i67.TaskService>(
      () => _i861.TaskServiceImpl(gh<_i300.TaskRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i300.TaskRepository>(
      () => _i3.TaskRepositoryLocalStorage(gh<_i135.TaskLocalDataSource>()),
      registerFor: {_prod},
    );
    gh.factory<_i645.TaskController>(() => _i645.TaskController(
          gh<_i67.TaskService>(),
          gh<_i849.NotificationService>(),
        ));
    gh.lazySingleton<_i1067.ThemeService>(
      () => _i736.ThemeServiceImpl(gh<_i328.ThemeRepository>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i892.ThemeController>(
        () => _i892.ThemeController(gh<_i1067.ThemeService>()));
    return this;
  }
}
