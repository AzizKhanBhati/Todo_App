import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/theme/color.dart';
import 'package:taskmanager/widgets/appbar.dart';
import 'package:taskmanager/widgets/listview.dart';
import 'package:taskmanager/widgets/textfield_and_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(50), child: MyAppBar()),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: GetX<Controller>(
          init: Controller(),
          builder: (controller) => Stack(
            children: [
              Container(
                child: controller.list.isEmpty
                    ? Container()
                    : Container(
                        height: size.height,
                        width: size.width,
                        child: MyListView(),
                      ),
              ),
              Container(
                child: MyTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
