import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/repositorie/task_repository_impl.dart';
import 'package:todoapp/domain/service/task_service_impl.dart';
import 'package:todoapp/presentation/page/home_page.dart';
import 'presentation/controller/task_controller.dart';


void main() {
  final repository = TaskRepositoryImpl();
  final taskService = TaskServiceImpl(repository);
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
