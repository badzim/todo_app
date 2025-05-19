import 'package:todoapp/domain/entitie/task.dart';

abstract class TaskService {
  Future<void> add(Task task);
  Future<List<Task>> getAll();
  Future<void> update(Task task);
  Future<void> delete(String id);
  Future<void> deleteAllCheckedTasks();
}