import 'package:flutter/material.dart';
import 'routes.dart';
import 'settings.dart';
import 'details.dart';
import 'home.dart';
import 'contact.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import the package for JSON decoding

void main() {
  runApp(SearchScreen());
}

class SearchScreen extends StatelessWidget {
  static const String routeName = "search"; // Define a routeName property

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: _SearchAppBar(),
      ),
      body: Center(
        child: _SearchBodyPage(),
      ),
      bottomNavigationBar: _SearchFooter(),
    );
  }
}

class _SearchAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF191923),
      shape:
          const Border(bottom: BorderSide(color: Color(0xFF2D2D39), width: 2)),
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
            "Search",
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

class _SearchBodyPage extends StatefulWidget {
  @override
  _SearchBodyPageState createState() => _SearchBodyPageState();
}

class _SearchBodyPageState extends State<_SearchBodyPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredCountries = [];

  // Data source (you can initialize it with your list of countries)
  List<dynamic> countriesData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch the initial data, similar to what you did in home.dart
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

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countriesData.where((country) {
        final name = country['name'];
        return name != null &&
            name.containsKey('common') &&
            name['common']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  filterCountries(query);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      filterCountries('');
                    },
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
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
                          countryName: name['common'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
          // Navigate to the Dashboard screen
          Navigator.pushNamed(context, HomeScreen.routeName);
        } else if (index == 2) {
          // Navigate to the Contact screen
          Navigator.pushNamed(context, ContactScreen.routeName);
        }
      },
    );
  }
}

// Navigation menu
void userprofile(BuildContext context) {
  Navigator.pushNamed(context, settings.routeName);
}
