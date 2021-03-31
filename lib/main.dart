import 'package:flutter/material.dart';
import 'package:yoga/constants/app_path.dart';
import 'package:yoga/modules/dashboard/screen/dashboard_screen.dart';
import 'package:yoga/widgets/background_screen.dart';

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
      home: DashboardScreen(),
    );
  }
}
