import 'package:flutter/material.dart';
import 'routes.dart';
import 'settings.dart';
import 'details.dart';
import 'home.dart';
import 'search.dart';

void main() {
  runApp(ContactScreen());
}

class ContactScreen extends StatelessWidget {
  static const String routeName = "contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _ContactAppBar(),
      ),
      body: Center(
        child: _ContactBodyPage(),
      ),
      bottomNavigationBar: _SearchFooter(),
    );
  }
}

class _ContactAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF191923),
      shape: const Border(bottom: BorderSide(color: Colors.white, width: 2)),
      title: Row(
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                'assets/earthLOGO2.png',
                width: 28,
                height: 28,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Contacts",
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
    );
  }
}

class _ContactBodyPage extends StatefulWidget {
  @override
  _ContactBodyPageState createState() => _ContactBodyPageState();
}

class _ContactBodyPageState extends State<_ContactBodyPage> {
  @override
  Widget build(BuildContext context) {
    // Your contact page content
    return Scaffold(
      body: Center(
        child: Text('Welcome to the contacts page!'),
      ),
    );
  }
}

class _SearchFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF191923),
      unselectedItemColor: Colors.white,
      selectedItemColor: Color(0xFF01BE96),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_phone_rounded),
          label: "Contact",
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, HomeScreen.routeName);
        } else if (index == 1) {
          // Call the searchpage function to navigate to SearchScreen
          Navigator.pushNamed(context, SearchScreen.routeName);
        }
      },
    );
  }
}

// Navigation menu
void userprofile(BuildContext context) {
  Navigator.pushNamed(context, settings.routeName);
}
