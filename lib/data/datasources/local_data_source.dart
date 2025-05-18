import 'package:hive/hive.dart';
import 'package:todoapp/data/model/task_model.dart';

class LocalDataSource {
  static const boxName = 'tasks';

  Future<Box<TaskModel>> _openBox() async {
    return await Hive.openBox<TaskModel>(boxName);
  }

  Future<void> addTask(TaskModel task) async {
    final box = await _openBox();
    await box.put(task.id, task);
  }

  Future<List<TaskModel>> getTasks() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> updateTask(TaskModel task) async {
    final box = await _openBox();
    await box.put(task.id, task);
  }

  Future<void> deleteTask(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  Future<void> deleteAllCheckedTasks() async {
    final box = await _openBox();
    final keysToDelete =
    box.values.where((t) => t.isDone).map((e) => e.id).toList();
    await box.deleteAll(keysToDelete);
  }
}
