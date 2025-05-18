// lib/presentation/controllers/task_controller.dart
import 'package:flutter/material.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/service/task_service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskController(this._taskService);

  Future<void> loadTasks() async {
    _tasks = await _taskService.getAll();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    await _taskService.add(task);
    await loadTasks();
  }

  Future<void> addTaskWithScore(String title, int score) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      score: score,
    );
    await _taskService.add(task);
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

  Future<void> editTask(Task task) async {
    await _taskService.update(task);
    await loadTasks();
  }

  void deleteCheckedTasks() {
    _tasks.removeWhere((task) => task.isDone);
    notifyListeners();
  }
}
