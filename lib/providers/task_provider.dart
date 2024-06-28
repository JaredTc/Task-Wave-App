


import 'package:taskwave/config/routes/imports.dart';
import 'package:taskwave/models/tasks_model.dart';
import 'package:taskwave/repositories/task_repository.dart';
class TaskProvider with ChangeNotifier {
  List<Tasks>? _taskProvider;

  final TaskRepository taskRepository;

  TaskProvider({required this.taskRepository});

  List<Tasks>? get tasks => _taskProvider;

  Future<void> fetchTasks() async {
    _taskProvider = await taskRepository.fetchTasks();
    notifyListeners();
  }
}