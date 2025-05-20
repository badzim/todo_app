import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/port/output/task_repository.dart';
import 'package:todoapp/domain/port/input/task_service.dart';

@LazySingleton(as: TaskService, env: [Environment.prod, Environment.dev])
class TaskServiceImpl implements TaskService {

  final TaskRepository repository;

  TaskServiceImpl(this.repository);

  @override
  Future<void> add(Task task) async {
    return repository.add(task);
  }

  @override
  Future<void> delete(String id) {
    return repository.delete(id);
  }

  @override
  Future<List<Task>> getAll() {
    return repository.getAll();
  }

  @override
  Future<void> update(Task task) {
    return repository.update(task);
  }

  @override
  Future<void> deleteAllCheckedTasks() {
    return repository.deleteAllCheckedTasks();
  }
}