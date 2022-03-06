import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget setupOrPunchlineText(String text,Function() clicked) {

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 400.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'Bobbers',
            color: Colors.blueGrey
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(text),
            ],
            onTap: clicked,
            isRepeatingAnimation: false,
            pause: const Duration(milliseconds: 50),
            key: Key(text),
          ),
        ),
      ),
    ),
  );
}
