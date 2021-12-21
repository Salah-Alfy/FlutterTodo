import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todos/app/core/utils/extensions.dart';
import 'package:todos/app/data/models/task.dart';
import 'package:todos/app/modules/home/controller.dart';

class TaskCard extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor.fromHex(task.color);
    var squareWidth = Get.width - 12.0.wp;

    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          blurRadius: 7,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            // TODO change after finish todo CRUD
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            selectedGradientColor: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            unselectedGradientColor: const LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Icon(
              IconData(task.icon, fontFamily: "MaterialIcons"),
              color: color,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(6.0.wp),
            child: Column(
              children: [
                Text(
                  task.title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0.wp,),
                Text(
                  "${task.todos?.length ?? 0} Task",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
