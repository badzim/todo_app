import 'package:easy_localization/easy_localization.dart';
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
      title: Text(tr('edit.title')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: tr('task.title')),
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
                child: Text('${tr('task.score')} $score'),
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
            title: Text(tr('edit.is_done')),
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text(tr('edit.cancel')),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text(tr('edit.save')),
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
