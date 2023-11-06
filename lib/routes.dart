import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'settings.dart';
import 'search.dart';
import 'contact.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  HomeScreen.routeName: (BuildContext context) => HomeScreen(),
  SearchScreen.routeName: (BuildContext context) => SearchScreen(),
  ContactScreen.routeName: (BuildContext context) => ContactScreen(),
  settings.routeName: (BuildContext context) => settings(),
};


/*
Color codes:
Tier 1 = 0xFF191923 Blackest
Tier 2 = 0xFF2D2D39 Black
Tier 3 = White
Tier 4 = 0xFF01BE96 Green
*/