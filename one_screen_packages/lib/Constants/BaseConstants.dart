import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class BaseConstants {
  static const String baseUrl = "https://joke.Api.gkamelo.xyz/random";
  static const String apiKey = "QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o";
  static TextStyle textStyleBlue(double textSize) {
   return  TextStyle(
     fontSize: textSize,
     fontFamily: 'Bobbers',
     color: Colors.blueGrey,
     fontWeight: FontWeight.bold,
     shadows: const [
       Shadow(
         color: Colors.black12,
         blurRadius: 5.0,
         offset: Offset(-5.0, 3.0),
       ),
     ],
   );
  }
  static const String smileText = "     :-)";
  static String connectivityNoneResult = ConnectivityResult.none.toString();
  static const double padding =10;
  static const double avatarRadius =30;
}
