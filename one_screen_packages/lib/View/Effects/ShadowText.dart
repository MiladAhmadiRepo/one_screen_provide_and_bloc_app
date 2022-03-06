import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShadowText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const ShadowText({Key? key, required this.data, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 2.0,
            child: Text(
              data,
              style: style?.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
