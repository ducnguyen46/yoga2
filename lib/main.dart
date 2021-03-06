import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yoga/modules/splashscreen/screen/welcome_screen.dart';
import 'package:yoga/modules/splashscreen/screen/yoga_coming.dart';

import 'modules/exercise/widget/countdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Countdown(),
        ),
      ],
      child: MaterialApp(
        title: 'Yoga',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: YogaComing(),
      ),
    );
  }
}
