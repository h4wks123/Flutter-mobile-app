import 'package:flutter/material.dart';
import 'customtextformfield.dart';
import 'primarybutton.dart';
import 'passwordfield.dart';
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
        backgroundColor: Colors.green[200],
        body: Container(
          color: Color(0xFF2D2D39),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                PasswordField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  obscureText: obscureText,
                  onTap: setPasswordVisibility,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                  text: "Login",
                  iconData: Icons.login,
                  onPressed: login,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ImageBelowLoginButton(), // Adding the custom image widget
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

class ImageBelowLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Image.asset(
          'assets/earthLOGO2.png', // Replace with the path to your image asset
          width: 200.0,
          height: 200.0,
        ),
      ],
    );
  }
}
