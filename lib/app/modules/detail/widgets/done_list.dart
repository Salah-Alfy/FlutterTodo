import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/app/core/utils/extensions.dart';
import 'package:todos/app/core/values/colors.dart';
import 'package:todos/app/modules/home/controller.dart';

class DoneList extends StatelessWidget {
  final controller = Get.find<HomeController>();
  DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.doneTodos.isNotEmpty
        ? ListView(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
                child: Text(
                  "Completed (${controller.doneTodos.length})",
                  style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                ),
              ),
              ...controller.doneTodos
                  .map((element) => Dismissible(
                        key: ObjectKey(element),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          controller.deleteDoneTodo(element);
                        },
                        background: Container(
                          color: Colors.red.withOpacity(0.8),
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 5.0.wp),
                            child: const Icon(Icons.delete,color: Colors.white,),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 9.0.wp),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.done,
                                  color: blue,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0.wp),
                                child: Text(
                                  element["title"],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ],
          )
        : Container());
  }
}
