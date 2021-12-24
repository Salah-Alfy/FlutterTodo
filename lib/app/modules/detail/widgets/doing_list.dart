import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/app/core/utils/extensions.dart';
import 'package:todos/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final controller = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => controller.doingTodos.isEmpty && controller.doneTodos.isEmpty
            ? Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0.wp),
                    child: Image.asset(
                      "assets/images/task.png",
                      fit: BoxFit.contain,
                      height: 65.0.wp,
                      width: 65.0.wp,
                    ),
                  ),
                  Text(
                    "Add Task",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0.sp,
                    ),
                  )
                ],
              )
            : ListView(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.doingTodos
                      .map((element) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0.wp, horizontal: 9.0.wp),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.grey),
                                    value: element["done"],
                                    onChanged: (value) {
                                      controller.doneTodo(element["title"]);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.0.wp),
                                  child: Text(
                                    element["title"],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  if (controller.doingTodos.isNotEmpty)
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.0.wp),
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                ],
              ));
  }
}
