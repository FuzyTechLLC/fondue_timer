import 'package:flutter/material.dart';
import 'package:fondue_timer/pages/TimerViewPage.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerViewPage(),
      theme: ThemeData(canvasColor: Colors.black, primaryColor: Colors.black, textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      )),

    );
  }
}

void main() {
  runApp(BaseApp());
}
