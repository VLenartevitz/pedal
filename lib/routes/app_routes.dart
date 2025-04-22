import 'package:flutter/material.dart';
import 'package:pedalserviceapp/screens/SplashScreen.dart';
import '../screens/ConnectScreen.dart';
import '../screens/QuestionScreen.dart';
import '../screens/Home.dart';
import '../screens/RegisterBike.dart';
import '../screens/WelcomeScreen.dart';

class Routes {
  static const String connect = '/';
  static const String questions = '/questions';
  static const String welcome = '/welcome';
  static const String registerEquips = '/registerequips';
  static const String registerBike = '/registerbike';
  static const String home = '/home';
  static const String splash = '/splash';


  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      connect: (context) => ConnectScreen(),
      questions: (context) =>   QuestionScreen(),
      welcome: (context) =>   WelcomeScreen(),
      registerBike: (context) =>   RegisterBike(),
      home: (context) => Home(),
      splash: (context) => SplashScreen(),

    };
  }
}
