



import 'package:todoapp/domain/entities/task.dart';
import 'package:todoapp/domain/repositories/task_repository.dart';
import 'package:todoapp/domain/services/task_service.dart';

class TaskServiceImpl implements TaskService {

  final TaskRepository repository;

  TaskServiceImpl(this.repository);

  @override
  Future<void> add(Task task) async {
    return repository.add(task);
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() {
    return repository.getAll();
  }

  @override
  Future<void> update(Task task) {
    return repository.update(task);
  }

}