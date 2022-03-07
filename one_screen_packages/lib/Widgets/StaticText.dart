import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../Constants/BaseConstants.dart';
import 'ContainBox.dart';

Widget StaticText(String text) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      style: BaseConstants.textStyleBlue(25),
    ),
  );
}
