import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/injection.dart';
import 'package:todoapp/presentation/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/controller/task_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());

  await configureDependencies(); // ⬅️ nouvelle méthode DI

  runApp(
    ChangeNotifierProvider(
      create: (_) => sl<TaskController>()..loadTasks(),
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
