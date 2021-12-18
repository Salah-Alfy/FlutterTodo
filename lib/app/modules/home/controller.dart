import 'package:get/get.dart';
import 'package:todos/app/data/models/task.dart';
import 'package:todos/app/data/services/storage/task_repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  HomeController({required this.taskRepository});

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTask());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));//when ever task changes write task
  }

  @override
  void onClose() {
    super.onClose();
  }
}
