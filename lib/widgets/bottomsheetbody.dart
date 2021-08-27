import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/widgets/typeselect.dart';

class BottomSheetGet extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectTheType(TypeSelect(
                    type: "Work",
                    show: true,
                  ));
                  Get.back();
                },
                child: Container(
                  width: size.width * .25,
                  child: TypeSelect(
                    type: "Work",
                    show: true,
                    textSize: 18,
                    heightwidth: 14,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              GestureDetector(
                onTap: () {
                  controller.selectTheType(TypeSelect(
                    type: "Fun",
                    show: true,
                  ));
                  Get.back();
                },
                child: Container(
                  width: size.width * .222,
                  child: TypeSelect(
                    type: "Fun",
                    show: true,
                    textSize: 18,
                    heightwidth: 14,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              GestureDetector(
                onTap: () {
                  controller.selectTheType(TypeSelect(
                    type: "Erand",
                    show: true,
                  ));
                  Get.back();
                },
                child: Container(
                  width: size.width * .26,
                  child: TypeSelect(
                    type: "Erand",
                    show: true,
                    textSize: 18,
                    heightwidth: 14,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              GestureDetector(
                onTap: () {
                  controller.selectTheType(TypeSelect(
                    type: "None",
                    show: true,
                  ));
                  Get.back();
                },
                child: Container(
                  width: size.width * .25,
                  child: TypeSelect(
                    type: "None",
                    show: true,
                    textSize: 18,
                    heightwidth: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
