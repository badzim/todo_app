import 'package:get_it/get_it.dart';
import 'package:todoapp/data/datasources/local_data_source.dart';
import 'package:todoapp/data/repositorie/task_repository_local_storage.dart';
import 'package:todoapp/domain/repositorie/task_repository.dart';
import 'package:todoapp/domain/service/task_service.dart';
import 'package:todoapp/domain/service/task_service_impl.dart';
import 'package:todoapp/presentation/controller/task_controller.dart';

/*
final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryLocalStorage(sl()));
  sl.registerLazySingleton<TaskService>(() => TaskServiceImpl(sl()));
  sl.registerLazySingleton(() => TaskController(sl()));
}
*/
