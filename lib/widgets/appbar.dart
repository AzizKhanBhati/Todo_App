import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/theme/color.dart';
import 'package:taskmanager/widgets/dialogbody.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: MyColors.backgroundColor,
      title: Text(
        "To Do App",
        style: TextStyle(color: MyColors.textColor),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            Get.dialog(
              DialogGet(
                  size: size,
                  text: "Do you want to delete all?",
                  deleteAll: true),
              transitionCurve: Curves.easeInOut,
              transitionDuration: Duration(milliseconds: 250),
            );
          },
          icon: Icon(Icons.delete),
          color: MyColors.textColor,
        )
      ],
    );
  }
}
