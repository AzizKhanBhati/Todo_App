import 'package:flutter/material.dart';
import 'package:taskmanager/theme/color.dart';

class TypeSelect extends StatelessWidget {
  final bool show;
  final String type;
  final double heightwidth;
  final double textSize;

  const TypeSelect(
      {Key? key,
      this.show = false,
      this.type = "None",
      this.heightwidth = 12,
      this.textSize = 14})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: heightwidth,
              width: heightwidth,
              decoration: BoxDecoration(
                  border: Border.all(color: _getColor(type), width: 4),
                  borderRadius: BorderRadius.circular(3)),
            ),
            Container(
              child: show
                  ? Text(
                      type,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: textSize,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(''),
            )
          ],
        ),
      ),
    );
  }

  _getColor(String s) {
    if (s == "Work") {
      return MyColors.workColor;
    } else if (s == "Erand") {
      return MyColors.erandColor;
    } else if (s == "Fun") {
      return MyColors.personalColor;
    } else {
      return Colors.lightGreen;
    }
  }
}
