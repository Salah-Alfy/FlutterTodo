import 'package:todos/app/data/models/task.dart';
import 'package:todos/app/data/providers/task/task_provider.dart';

class TaskRepository {
  //this class to asses the provider class

  TaskProvider taskProvider;

  TaskRepository({required this.taskProvider});

  List<Task> readTask() => taskProvider.readTask();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
