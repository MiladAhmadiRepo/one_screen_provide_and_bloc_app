import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../Constants/BaseConstants.dart';
import 'ContainBox.dart';

Widget SetupOrPunchlineWidget(String text,{Function()? clicked,bool? visible}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style:BaseConstants.textStyleBlue(25),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(text),
          ],
          onTap: clicked??(){},
          isRepeatingAnimation: false,
          pause: const Duration(milliseconds: 50),
          key: Key(text),
        ),
      ),
    ),
  );
}
