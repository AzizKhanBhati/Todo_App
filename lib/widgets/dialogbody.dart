import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/theme/color.dart';

class DialogGet extends StatelessWidget {
  final mcontroller = Get.put(Controller());
  final Size size;
  final String text;
  final int index;
  final bool deleteAll;

  DialogGet(
      {Key? key,
      required this.size,
      required this.text,
      required this.deleteAll,
      this.index = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: size.width * .3,
          width: size.width * .6,
          child: Card(
            color: MyColors.backgroundColor,
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: MyColors.tileBGColor,
                          onPressed: () {
                            deleteAll
                                ? mcontroller.deleteAllTask()
                                : mcontroller.deleteTask(
                                    mcontroller.list[index].text.toString(),
                                    index);
                            Get.back();
                          },
                          child: Text("Yes")),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: MyColors.tileBGColor,
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("No")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
