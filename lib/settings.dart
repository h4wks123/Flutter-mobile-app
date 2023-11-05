import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('settings Page'),
      ),
      body: const Center(
        child: Text('Welcome to the settings page!'),
      ),
    );
  }
}

class  MySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to My Flutter App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another page or perform an action
              },
              child: Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
