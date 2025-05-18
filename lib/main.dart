import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/datasources/local_data_source.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/data/repositorie/task_repository_in_memory.dart';
import 'package:todoapp/data/repositorie/task_repository_local_storage.dart';
import 'package:todoapp/domain/service/task_service_impl.dart';
import 'package:todoapp/presentation/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/controller/task_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());

  final local = LocalDataSource();
  final repository_local_storage = TaskRepositoryLocalStorage(local);
  final repository_in_memory = TaskRepositoryInMemory();

  final taskService = TaskServiceImpl(repository_local_storage);
  final controller = TaskController(taskService);

  runApp(
    ChangeNotifierProvider(
      create: (_) => controller..loadTasks(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
