import 'package:flutter/material.dart';
import 'routes.dart';
import 'settings.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: routes,
  ));
}

class HomeScreen extends StatelessWidget {
  static const String routeName = "home"; // Define a routeName property

  @override
  Widget build(BuildContext context) {
    return _HomeScreenState(); // Create an instance of _HomeScreenState
  }
}

class _HomeScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF191923),
        shape: const Border(bottom: BorderSide(color: Colors.white, width: 2)),
        title: Row(
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  'assets/earthLOGO2.png', // Replace with the path to your image asset
                  width: 28, // Set the width as needed
                  height: 28, // Set the height as needed
                  color: Colors.white, // You can set the color of the image
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Dashboard",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              userprofile(
                  context); // Call the function to navigate to the settings page
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust the padding as needed
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the home page!'),
      ),
    );
  }
}

//Navigation menu
void userprofile(BuildContext context) {
  Navigator.pushNamed(context, settings.routeName);
}
