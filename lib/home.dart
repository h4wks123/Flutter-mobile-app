import 'package:flutter/material.dart';
import 'routes.dart';
import 'settings.dart';
import 'details.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import the package for JSON decoding

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
        child: _HomeBodyPage(),
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

class _HomeBodyPage extends StatefulWidget {
  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<_HomeBodyPage> {
  List<dynamic> countriesData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name,eng,capital'));

    if (response.statusCode == 200) {
      setState(() {
        countriesData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: countriesData.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: countriesData.length,
              itemBuilder: (context, index) {
                final country = countriesData[index];
                final name = country['name'];
                final capital = country['capital'];

                return ListTile(
                  title: Text(
                    name != null && name.containsKey('common')
                        ? name['common']
                        : 'N/A',
                  ),
                  subtitle: Text(
                    capital != null && capital.isNotEmpty ? capital[0] : 'N/A',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryDetailsPage(
                          countryName: name[
                              'common'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class _HomeFooter extends StatelessWidget {
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
        )
      ],
    );
  }
}

// Navigation menu
void userprofile(BuildContext context) {
  Navigator.pushNamed(context, settings.routeName);
}
