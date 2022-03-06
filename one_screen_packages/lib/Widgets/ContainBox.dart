import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants/BaseConstants.dart';

Widget ContainBox(Widget child, {String titleText = "Tappable"}) {
  return Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle,
        ),
        child: child,
      ),
      titleText.isNotEmpty
          ? Positioned(
              left: 50,
              top: 5,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                color: Colors.grey[50],
                child: Text(
                  titleText,
                  style: BaseConstants.textStyleBlue(18),
                ),
              ))
          : Container(),
    ],
  );
}
