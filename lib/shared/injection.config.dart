// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasources/local_data_source.dart' as _i305;
import '../data/repositorie/task_repository_in_memory.dart' as _i601;
import '../data/repositorie/task_repository_local_storage.dart' as _i3;
import '../domain/repositorie/task_repository.dart' as _i340;
import '../domain/service/task_service.dart' as _i669;
import '../domain/service/task_service_impl.dart' as _i861;
import '../presentation/controller/language_controller.dart' as _i545;
import '../presentation/controller/task_controller.dart' as _i645;

const String _dev = 'dev';
const String _prod = 'prod';

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
    gh.lazySingleton<_i305.LocalDataSource>(() => _i305.LocalDataSource());
    gh.lazySingleton<_i340.TaskRepository>(
      () => _i601.TaskRepositoryInMemory(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i340.TaskRepository>(
      () => _i3.TaskRepositoryLocalStorage(gh<_i305.LocalDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i669.TaskService>(
        () => _i861.TaskServiceImpl(gh<_i340.TaskRepository>()));
    gh.factory<_i645.TaskController>(
        () => _i645.TaskController(gh<_i669.TaskService>()));
    return this;
  }
}
