import 'package:get/get.dart';
import 'package:todos/app/data/providers/task/task_provider.dart';
import 'package:todos/app/data/services/storage/task_repository.dart';
import 'package:todos/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(taskProvider: TaskProvider()),
      ),
    );
  }
}
