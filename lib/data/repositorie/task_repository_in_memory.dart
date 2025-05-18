import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/repositorie/task_repository.dart';

@LazySingleton(as: TaskRepository, env: [Environment.dev])
class TaskRepositoryInMemory implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<void> add(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<List<Task>> getAll() async {
    return _tasks;
  }

  @override
  Future<void> update(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }

  @override
  Future<void> delete(String id) async {
    _tasks.removeWhere((task) => task.id == id);
  }
}
