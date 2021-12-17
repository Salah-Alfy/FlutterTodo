import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/app/data/services/storage/storage_services.dart';
import 'package:todos/app/modules/home/view.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageServices().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeView(),
    );
  }
}
