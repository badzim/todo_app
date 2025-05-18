import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todoapp/domain/entitie/task.dart';
import 'package:todoapp/domain/repositorie/task_repository.dart';
import 'package:todoapp/domain/service/task_service_impl.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late TaskServiceImpl service;
  late MockTaskRepository mockRepository;

  setUp(() {
    mockRepository = MockTaskRepository();
    service = TaskServiceImpl(mockRepository);
  });

  final testTask = Task(id: '1', title: 'Test Task');

  group('TaskServiceImpl', () {
    test('add() should call repository.add with given task', () async {
      when(() => mockRepository.add(testTask)).thenAnswer((_) async {});

      await service.add(testTask);

      verify(() => mockRepository.add(testTask)).called(1);
    });

    test('getAll() should return list of tasks from repository', () async {
      when(() => mockRepository.getAll()).thenAnswer((_) async => [testTask]);

      final result = await service.getAll();

      expect(result, [testTask]);
      verify(() => mockRepository.getAll()).called(1);
    });

    test('update() should call repository.update with given task', () async {
      when(() => mockRepository.update(testTask)).thenAnswer((_) async {});

      await service.update(testTask);

      verify(() => mockRepository.update(testTask)).called(1);
    });

    test('delete() throws UnimplementedError', () {
      expect(() => service.delete('1'), throwsUnimplementedError);
    });
  });
}
