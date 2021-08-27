import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/model/listmodel.dart';
import 'package:taskmanager/theme/color.dart';

class MyCheckBox extends StatelessWidget {
  final controller = Get.find<Controller>();
  final int index;

  MyCheckBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.checkboxColor,
          borderRadius: BorderRadius.circular(6)),
      width: 22,
      height: 22,
      child: Checkbox(
        side: BorderSide(width: 6, color: MyColors.checkboxColor),
        value: controller.list[index].isChecked,
        onChanged: (val) {
          ListModel changed = controller.list[index];
          changed.isChecked = val!;
          controller.list[index] = changed;
          controller.updateTask(changed, index);
        },
        activeColor: MyColors.checkboxColor,
        fillColor: MaterialStateProperty.all(MyColors.checkboxColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
