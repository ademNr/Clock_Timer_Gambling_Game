import 'package:flutter/material.dart';
import 'package:gambling_game/Points_selection.dart';
import 'package:gambling_game/timer_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: PointsSelection(  ),
    );
  }
}
