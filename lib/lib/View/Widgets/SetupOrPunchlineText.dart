import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget setupOrPunchlineText(String text,Function clicked) {

  return Center(
    child: SizedBox(
      width: 400.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Bobbers',
          color: Colors.red
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(text),
          ],
          onTap: () {
            clicked();
            print("Tap Event");
          },
          isRepeatingAnimation: false,
          pause: Duration(milliseconds: 100),
          key: Key(text),
        ),
      ),
    ),
  );
}
