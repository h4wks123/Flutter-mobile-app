import 'package:flutter/material.dart';
import 'main.dart';
import 'routes.dart';

void main() {
  runApp(settings());
}

class settings extends StatelessWidget {
  static const String routeName = "settings"; // Define a routeName property

  @override
  Widget build(BuildContext context) {
    // Your settings page content
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _SettingsAppBar(),
      ),
      body: Center(
        child: _SettingsBodyPage(),
      ),
    );
  }
}

class _SettingsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF191923),
      shape:
          const Border(bottom: BorderSide(color: Color(0xFF2D2D39), width: 2)),
      title: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          const Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to leave?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set the text color
              ),
            ),
            SizedBox(height: 32), // Add more space between the text and button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF01BE96), // Set the button color to green
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 16), // Increase button size
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18, // Adjust button text size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
