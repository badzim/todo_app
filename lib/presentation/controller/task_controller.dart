import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/service/task_service.dart';

@injectable
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

  void toggleTaskStatus(String id) async {
    final index = _tasks.indexWhere((t) => t.id == id);

    if (index != -1) {
      final current = _tasks[index];
      editTask(current.copyWith(isDone: !current.isDone));
    }
  }

  Future<void> editTask(Task task) async {
    await _taskService.update(task);
    await loadTasks();
  }

  void deleteAllCheckedTasks() async {
    await _taskService.deleteAllCheckedTasks();
    await loadTasks();
  }
}
