import 'package:flutter/material.dart';
import 'package:yoga/modules/dashboard/screen/dashboard_screen.dart';
import 'package:yoga/modules/exercise/screen/exercise_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: ExerciseListScreen(),
    );
  }
}
