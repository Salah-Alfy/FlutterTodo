import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/app/core/utils/extensions.dart';
import 'package:todos/app/modules/home/controller.dart';
import 'package:todos/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  var child;

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
        width: squareWidth / 2,
        height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        child: InkWell(
          onTap: () {},
          child: DottedBorder(
            color: Colors.grey[400]!,
            dashPattern: const [8, 4],
            child: Center(
                child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            )),
          ),
        ));
  }
}
