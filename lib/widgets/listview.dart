import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/theme/color.dart';
import 'package:taskmanager/widgets/checkBox.dart';
import 'package:taskmanager/widgets/dialogbody.dart';
import 'package:taskmanager/widgets/listtileText.dart';
import 'package:taskmanager/widgets/typeselect.dart';

class MyListView extends StatelessWidget {
  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.list.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          confirmDismiss: (d) async {
            await Get.dialog(
              DialogGet(
                  index: index,
                  size: size,
                  text: "Are you sure you want to delete?",
                  deleteAll: false),
              transitionCurve: Curves.easeInOut,
              transitionDuration: Duration(milliseconds: 250),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Container(
              height: size.height * .06,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(
                  color: MyColors.tileBGColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  /// check Box
                  MyCheckBox(index: index),

                  SizedBox(
                    width: size.width * .05,
                  ),

                  /// text
                  MyListTileText(index: index, size: size),

                  Spacer(),

                  TypeSelect(
                    type: controller.list[index].type!,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
