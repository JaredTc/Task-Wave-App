

import 'package:taskwave/models/tasks_model.dart';
import 'package:taskwave/services/task_service.dart';
class TaskRepository {
  final TaskService taskService;

  TaskRepository({required this.taskService});

  Future<List<Tasks>> fetchTasks() async {
    return await taskService.fetchTasks();
  }
}
