// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasources/local_data_source.dart' as _i481;
import '../data/repositorie/task_repository_in_memory.dart' as _i408;
import '../data/repositorie/task_repository_local_storage.dart' as _i567;
import '../domain/repositorie/task_repository.dart' as _i1064;
import '../domain/service/task_service.dart' as _i185;
import '../domain/service/task_service_impl.dart' as _i256;
import '../presentation/controller/task_controller.dart' as _i842;

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
    gh.lazySingleton<_i481.LocalDataSource>(() => _i481.LocalDataSource());
    gh.lazySingleton<_i1064.TaskRepository>(
      () => _i408.TaskRepositoryInMemory(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1064.TaskRepository>(
      () => _i567.TaskRepositoryLocalStorage(gh<_i481.LocalDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i185.TaskService>(
        () => _i256.TaskServiceImpl(gh<_i1064.TaskRepository>()));
    gh.factory<_i842.TaskController>(
        () => _i842.TaskController(gh<_i185.TaskService>()));
    return this;
  }
}
