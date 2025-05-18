import 'package:hive/hive.dart';
import 'package:todoapp/domain/entitie/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int score;

  @HiveField(3)
  final bool isDone;

  @HiveField(4)
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.score,
    required this.isDone,
    required this.createdAt,
  });

  factory TaskModel.fromEntity(Task task) => TaskModel(
    id: task.id,
    title: task.title,
    score: task.score,
    isDone: task.isDone,
    createdAt: task.createdAt,
  );

  Task toEntity() => Task(
    id: id,
    title: title,
    score: score,
    isDone: isDone,
    createdAt: createdAt,
  );
}
