import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todos/app/core/utils/extensions.dart';
import 'package:todos/app/modules/home/controller.dart';

class AddDialog extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      controller.editController.clear();
                      controller.chooseTask(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.choosenTask.value == null) {
                          EasyLoading.showError("Please Select Task Type");
                        } else {
                          var success = controller.updateTask(
                            controller.choosenTask.value!,
                            controller.editController.text
                          );
                          if (success) {
                            EasyLoading.showSuccess("Todo item add success");
                            Get.back();
                            controller.chooseTask(null);
                          } else {
                            EasyLoading.showError("Todo item already exist");
                          }
                          controller.editController.clear();
                        }
                      }
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 14.0.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                "New Task",
                style:
                    TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: controller.editController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!)),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please Enter Your Todo Item";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 5.0.wp, bottom: 2.0.wp, right: 5.0.wp, left: 5.0.wp),
              child: Text(
                "Add to",
                style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
              ),
            ),
            ...controller.tasks
                .map((element) => Obx(
                      () => InkWell(
                        onTap: () => controller.chooseTask(element),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 3.0.wp, horizontal: 5.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconData(element.icon,
                                        fontFamily: "MaterialIcons"),
                                    color: HexColor.fromHex(element.color),
                                  ),
                                  SizedBox(
                                    width: 3.0.wp,
                                  ),
                                  Text(element.title,
                                      style: TextStyle(
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              if (controller.choosenTask.value == element)
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
