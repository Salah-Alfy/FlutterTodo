import 'dart:convert';

import 'package:get/get.dart';
import 'package:todos/app/core/utils/keys.dart';
import 'package:todos/app/data/models/task.dart';
import 'package:todos/app/data/services/storage/storage_services.dart';

class TaskProvider {
  final StorageServices _storage = Get.find<StorageServices>();

  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
