import 'package:flutter/material.dart';
import '../Animation/LoadingBouncingGrid.dart';

Widget loadingWidget(){
  return Center(
    child: LoadingBouncingGrid.square(
      borderColor: Colors.lightBlueAccent.shade100,
      borderSize: 1.0,
      size: 80.0,
      backgroundColor: Colors.blueGrey,
      duration: const Duration(milliseconds: 500),
    ),
  );
}