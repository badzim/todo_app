import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/controllers/task_controller.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/get_tasks.dart';
import 'data/repositories/task_repository_impl.dart';

void main() {
  final repository = TaskRepositoryImpl();
  final addTask = AddTask(repository);
  final getTasks = GetTasks(repository);
  final controller = TaskController(addTask, getTasks);

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
