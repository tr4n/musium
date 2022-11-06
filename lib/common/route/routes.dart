import 'package:flutter/material.dart';

import '../../ui/screens/screens.dart';
class Routes {
  Routes._();

  //screen name
  static const String splashScreen = "/splashScreen";
  static const String homeScreen = "/homeScreen";
  static const String searchScreen = "/searchScreen";
  static const String watchListScreen = "/watchListScreen";
  static const String detailScreen = "/detailScreen";

  //init screen name
  static String get initScreen => splashScreen;

  static final routes = <String, WidgetBuilder>{
    homeScreen: (context) => const MyHomePage(title: ""),
    splashScreen: (context) => const SplashScreen(),
  };
}
