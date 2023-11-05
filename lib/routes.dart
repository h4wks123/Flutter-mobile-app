import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'settings.dart';
// import 'details.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  settings.routeName: (BuildContext context) => settings(), 
};


/*
Color codes:
Tier 1 = 0xFF191923
Tier 2 = 
Tier 3 = White
Tier 4 = 
*/