import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/database/databasehelper.dart';
import 'package:taskmanager/model/Constants.dart';
import 'package:taskmanager/model/listmodel.dart';
import 'package:taskmanager/widgets/typeselect.dart';

class Controller extends GetxController {
  var list = <ListModel>[].obs;

  var key = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();

  var typeselect = TypeSelect(
    show: true,
  ).obs;
  selectTheType(TypeSelect typeSelect) => typeselect.value = typeSelect;

  @override
  void onInit() {
    _getTask();
    super.onInit();
  }

  void _getTask() async {
    // ListModel listModel = await DatabaseHelper.instance.readItem(1); // read specific item
    // list.add(listModel);
    await DatabaseHelper.instance.readAll().then((val) {
      // read all items
      val.forEach((element) {
        int io = element[MyConstants
            .columnDone]; // returns true(1) or false(0) in integer formate
        bool isChecked = io == 1 ? true : false; // convert int to bool
        list.add(ListModel(
            id: element[MyConstants.columnId],
            text: element[MyConstants.columnTitle],
            type: element[MyConstants.columnType],
            isChecked: isChecked));
      });
    });
  }

  void addTask() async {
    ListModel listModel = await DatabaseHelper.instance.insert(
        ListModel(text: textController.text, type: typeselect.value.type));
    list.insert(0, listModel);
    textController.clear();
  }

  void deleteTask(String str, int id) async {
    await DatabaseHelper.instance.delete(str);
    list.removeAt(id);
  }

  void deleteAllTask() async {
    await DatabaseHelper.instance.clearTable();
    list.removeRange(0, list.length);
  }

  void updateTask(ListModel todo, int id) async {
    await DatabaseHelper.instance.update(todo);
  }
}
