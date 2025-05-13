package domain.entities.task;

import java.time.LocalDateTime;

class Task {
    final String id;
    final String title;
    final int score;
    final boolean isDone;
    final LocalDateTime createdAt;

    Task(
            String id,
            String title,
            int score,
            boolean isDone,
            LocalDateTime createAt
    ) {
        this.id = id;
        this.title = title;
        this.score = score;
        this.isDone = isDone;
        this.createdAt = createAt;
    }
}