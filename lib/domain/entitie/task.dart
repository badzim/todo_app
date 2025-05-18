
class Task {
  final String id;
  final String title;
  final int score;
  final bool isDone;
  final DateTime createdAt;

  Task( {
      required this.id,
      required this.title,
      this.score = 1,
      this.isDone = false,
      DateTime? createdAt
      }
      ) : createdAt = createdAt ?? DateTime.now();

  Task copyWith({
    String? id,
    String? title,
    int? score,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      score: score ?? this.score,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );}
}