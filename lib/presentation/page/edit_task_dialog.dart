import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/presentation/controller/task_controller.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;

  const EditTaskDialog({super.key, required this.task});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late int _score;
  late bool _isDone;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _score = widget.task.score;
    _isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context, listen: false);

    return AlertDialog(
      title: const Text('Modifier la tâche'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Titre'),
          ),
          DropdownButton<int>(
            value: _score,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _score = value;
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
          CheckboxListTile(
            value: _isDone,
            onChanged: (value) {
              setState(() {
                _isDone = value ?? false;
              });
            },
            title: const Text('Marquer comme faite'),
          )
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Annuler'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Enregistrer'),
          onPressed: () {
            final updatedTask = widget.task.copyWith(
              title: _titleController.text,
              score: _score,
              isDone: _isDone,
            );
            controller.editTask(updatedTask);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
