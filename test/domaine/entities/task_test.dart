import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/domain/entitie/task.dart';

void main() {
  test('Create task should store correct title', () {
    final task = Task(id: '1', title: 'Test');
    expect(task.title, 'Test');
  });
}
