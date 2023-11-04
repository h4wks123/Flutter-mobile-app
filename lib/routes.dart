import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'details.dart';
import 'settings.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  home.routeName: (BuildContext context) => home(),
  // details.routeName: (BuildContext context) => Registration(),
  // ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  // UserProfile.routeName: (BuildContext context) => UserProfile(),
};
