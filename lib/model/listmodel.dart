import 'package:taskmanager/model/Constants.dart';

class ListModel {
  int? id;
  String? text;
  String? type;
  bool? isChecked;

  ListModel({this.id, this.text, this.isChecked = false, this.type});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      MyConstants.columnTitle: text,
      MyConstants.columnType: type,
      MyConstants.columnDone: isChecked == true ? 1 : 0
    };
    if (id != null) {
      map[MyConstants.columnId] = id;
    }
    return map;
  }

  ListModel.fromMap(Map<dynamic, dynamic> map) {
    id = map[MyConstants.columnId];
    text = map[MyConstants.columnTitle];
    type = map[MyConstants.columnType];
    isChecked = map[MyConstants.columnDone] == 1;
  }
}
