
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
}