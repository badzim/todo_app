import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/presentation/controller/language_controller.dart';
import 'package:todoapp/shared/injection.dart';
import 'package:todoapp/presentation/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/controller/task_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🌍 EasyLocalization
  await EasyLocalization.ensureInitialized();

  // 🐝 Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());

  // 🧠 Dependency Injection
  await configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fr')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => sl<TaskController>()..loadTasks()),
            ChangeNotifierProvider(
              create: (_) => sl<LanguageController>()
            ),
          ],
          child: const MyApp()
        )
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}
