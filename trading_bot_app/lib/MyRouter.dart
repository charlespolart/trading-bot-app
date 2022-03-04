import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:trading_bot_app/App.dart';

class MyRouter {
  static FluroRouter fluroRouter = FluroRouter();
  static Handler _appHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) => App());

  static void setupRouter() {
    fluroRouter.define("/app", handler: _appHandler);
  }
}
