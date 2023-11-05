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
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _HomeAppBar(),
      ),
      body: Center(
        child: __HomeBodyPage(),
      ),
      bottomNavigationBar: _HomeFooter(),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
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
    );
  }
}

class __HomeBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is a custom body widget'),
    );
  }
}

class _HomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF191923),
      unselectedItemColor: Colors.white,
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
        )
      ],
    );
  }
}

// Navigation menu
void userprofile(BuildContext context) {
  Navigator.pushNamed(context, settings.routeName);
}
