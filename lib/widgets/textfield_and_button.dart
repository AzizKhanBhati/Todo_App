import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/theme/color.dart';
import 'package:taskmanager/widgets/bottomsheetbody.dart';

class MyTextField extends StatelessWidget {
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),

            /// form
            child: Form(
              key: controller.key,
              child: Row(
                children: [
                  Container(
                    height: size.height * .065,
                    width: size.width * .85,
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),

                        /// TextFormField
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, bottom: 10),
                          child: TextFormField(
                            controller: controller.textController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              suffix:
                                  mySuffix(controller: controller, size: size),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                // bottom: 4,
                                left: 8,
                                right: 12,
                              ),
                              hintText: "Today's task...",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Task Inserting Button
                  Container(
                    height: size.height * .08,
                    width: size.width * .12,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: myButton(controller: controller),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myButton({required Controller controller}) {
    return FloatingActionButton(
      onPressed: () {
        if (controller.textController.text.isNotEmpty) {
          controller.addTask();
        }
      },
      backgroundColor: MyColors.tileBGColor,
      child: Icon(
        Icons.arrow_forward_ios,
        color: MyColors.checkboxColor,
      ),
    );
  }

  Widget mySuffix({required Controller controller, required Size size}) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          BottomSheetGet(),
          barrierColor: Colors.transparent,
          backgroundColor: MyColors.tileBGColor,
        );
      },
      child: Container(
        /// suffix
        decoration: BoxDecoration(
            color: MyColors.tileBGColor,
            borderRadius: BorderRadius.circular(16)),
        height: size.height * .05,
        width: size.width * .165,
        child: Center(child: controller.typeselect.value),
      ),
    );
  }
}
