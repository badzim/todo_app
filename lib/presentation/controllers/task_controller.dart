// lib/presentation/controllers/task_controller.dart
import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/get_tasks.dart';

class TaskController extends ChangeNotifier {
  final AddTask _addTask;
  final GetTasks _getTasks;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskController(this._addTask, this._getTasks);

  Future<void> loadTasks() async {
    _tasks = await _getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    await _addTask(task);
    await loadTasks();
  }

  void toggleTaskStatus(String id) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      final current = _tasks[index];
      _tasks[index] = current.copyWith(isDone: !current.isDone);
      notifyListeners();
    }
  }

  void deleteCheckedTasks() {
    _tasks.removeWhere((task) => task.isDone);
    notifyListeners();
  }
}
