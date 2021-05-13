import 'package:flutter/material.dart';
import 'package:fondue_timer/UX/FuzColors.dart';
import 'package:fondue_timer/pages/TimerViewPage.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerViewPage(),
      theme: ThemeData(
        canvasColor: FuzColors.main,
        primaryColor: FuzColors.main,
        accentColor: Colors.white,
        colorScheme: ColorScheme(
          primary: FuzColors.main,
          secondary: Colors.white,
          onPrimary: Colors.white,
          onSecondary: FuzColors.main,
          primaryVariant: FuzColors.mainAccent,
          secondaryVariant: FuzColors.mainAccent,
          background: FuzColors.main,
          onBackground: Colors.white,
          surface: FuzColors.main,
          onSurface: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white, fontSize: 40, )
        ),
        textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white), textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)))),
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}

void main() {
  runApp(BaseApp());
}
