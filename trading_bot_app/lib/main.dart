import 'package:flutter/material.dart';

import 'package:trading_bot_app/MyRouter.dart';
import 'package:trading_bot_app/Style.dart';

void main() {
  MyRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'app',
      onGenerateRoute: MyRouter.fluroRouter.generator,
      theme: ThemeData(
          primarySwatch: GColor.primary,
          unselectedWidgetColor: GColor.text?.withOpacity(0.5),
          textTheme: TextTheme(
            subtitle2: TextStyle(
              color: GColor.text?.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            bodyText2: TextStyle(color: GColor.text),
          ),
          canvasColor: GColor.background),
    );
  }
}
