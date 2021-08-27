import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/theme/color.dart';

class MyListTileText extends StatelessWidget {
  final controller = Get.find<Controller>();
  final int index;
  final Size size;

  MyListTileText({Key? key, required this.index, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .6,
      child: Text(
        "${controller.list[index].text}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
            color: MyColors.textColor,
            fontWeight: FontWeight.w400,
            decoration: controller.list[index].isChecked!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontSize: 16),
      ),
    );
  }
}
