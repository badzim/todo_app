import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final controller = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes ToDos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Supprimer les tâches cochées',
            onPressed: controller.deleteCheckedTasks,
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
                    decoration: const InputDecoration(
                      hintText: 'Ajouter une tâche',
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
                      child: Text('Score $score'),
                    );
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = inputController.text.trim();
                    if (title.isNotEmpty) {
                      controller.addTaskWithScore(title, selectedScore);
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
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) {
                final task = controller.tasks[index];
                return ListTile(
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (_) {
                      controller.toggleTaskStatus(task.id);
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
                  subtitle: Text('Score: ${task.score}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}