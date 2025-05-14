import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      // conteneur de base
      appBar: AppBar(
        // barre du haut
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
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = inputController.text.trim();
                    if (title.isNotEmpty) {
                      controller.addTask(title);
                      inputController.clear();
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
                  subtitle: Text('Score: ${task.score}, createdAt: ${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
