import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/presentation/controller/language_controller.dart';
import 'package:todoapp/presentation/page/edit_task_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:todoapp/presentation/page/settings_page.dart';
import '../controller/task_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController inputController = TextEditingController();

  int selectedScore = 1;

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context);
    final languageController = Provider.of<LanguageController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('home.title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: tr('settings.title'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: tr('home.delete_done'),
            onPressed: taskController.deleteAllCheckedTasks,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      hintText: tr('home.add_task_hint'),
                    ),
                  ),
                ),
                DropdownButton<int>(
                  value: selectedScore,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedScore = value;
                      });
                    }
                  },
                  items: List.generate(5, (index) {
                    final score = index + 1;
                    return DropdownMenuItem(
                      value: score,
                      child: Text('${tr('task.score')} $score'),
                    );
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = inputController.text.trim();
                    if (title.isNotEmpty) {
                      taskController.addTaskWithScore(title, selectedScore);
                      inputController.clear();
                      setState(() {
                        selectedScore = 1;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return ListTile(
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (_) {
                      taskController.toggleTaskStatus(task.id);
                    },
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => EditTaskDialog(task: task),
                    );
                  },
                  subtitle: Text('${tr('task.score')} ${task.score}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}