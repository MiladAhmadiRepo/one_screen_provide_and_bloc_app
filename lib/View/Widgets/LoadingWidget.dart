import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Animation/LoadingBouncingGrid.dart';

Widget loadingWidget(){
  return Center(
    child: LoadingBouncingGrid.square(
      borderColor: Colors.cyan,
      borderSize: 3.0,
      size: 80.0,
      backgroundColor: Colors.cyanAccent,
      duration: Duration(milliseconds: 500),
    ),
  );
}