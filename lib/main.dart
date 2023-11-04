import 'package:flutter/material.dart';
import 'package:midterm_bayer/primarybutton.dart';
import 'package:midterm_bayer/secondarybutton.dart';
import 'routes.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: const LoginScreen(),
    routes: routes,
  ));
}

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextFormField(
                    labelText: "Email Address",
                    hintText: "Enter a valid email",
                    iconData: Icons.email,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20.0,
                ),
                PasswordField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    obscureText: obscureText,
                    onTap: setPasswordVisibility),
                const SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                    text: "Login", iconData: Icons.login, onPressed: login),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushNamed(context, home.routeName);
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
