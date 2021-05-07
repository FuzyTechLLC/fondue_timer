import 'package:flutter/material.dart';
import 'package:fondue_timer/pages/TimerViewPage.dart';


class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerViewPage()
    );
  }
}

void main() {
  runApp(BaseApp());
}
