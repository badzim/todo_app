import 'package:injectable/injectable.dart';
import 'package:todoapp/data/model/task_model.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/port/output/task_repository.dart';
import '../datasources/task_local_data_source.dart';

@LazySingleton(as: TaskRepository, env: [Environment.prod])
class TaskRepositoryLocalStorage implements TaskRepository {
  final TaskLocalDataSource dataSource;

  TaskRepositoryLocalStorage(this.dataSource);

  @override
  Future<void> add(Task task) async {
    await dataSource.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<List<Task>> getAll() async {
    final models = await dataSource.getTasks();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> update(Task task) async {
    await dataSource.updateTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> delete(String id) async {
    await dataSource.deleteTask(id);
  }

  @override
  Future<void> deleteAllCheckedTasks() async {
    await dataSource.deleteAllCheckedTasks();
  }
}
