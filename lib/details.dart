import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryDetailsPage extends StatelessWidget {
  final String countryName; // The country name

  CountryDetailsPage({
    required this.countryName,
  });

  Future<Map<String, dynamic>> fetchCountryDetails() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name,capital,currencies,languages,region,subregion,flags'));

    if (response.statusCode == 200) {
      final List<dynamic> countries = json.decode(response.body);

      for (var country in countries) {
        if (country['name']['common'] == countryName) {
          return country;
        }
      }
    }

    return {};
  }

  String removeBrackets(String input) {
    // Remove brackets if they exist in the input string
    return input.replaceAll(RegExp('[]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191923), // Set the background color here
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchCountryDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              final country = snapshot.data!;
              final commonName = country['name']['common'] ?? 'N/A';
              final languages = country['languages'] ?? 'N/A';
              final currencies = country['currencies'] ?? 'N/A';
              final capital = country['capital'] ?? 'N/A';
              final region = country['region'] ?? 'N/A';
              final subregion = country['subregion'] ?? 'N/A';
              final flagUrl = country['flags']['png'] ?? '';

              return AlertDialog(
                title: Text('Country Details'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color(0xFF01BE96), // Set the button color to green
                    ),
                    child: Text('Close'),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (flagUrl.isNotEmpty)
                      Center(
                        child: Image.network(
                          flagUrl,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Country: $commonName'),
                        SizedBox(height: 10),
                        Text('Languages: ${languages.values.join(', ')}'),
                        SizedBox(height: 10),
                        Text('Currencies: ${currencies.keys.join(', ')}'),
                        SizedBox(height: 10),
                        Text('Capital: $capital'),
                        SizedBox(height: 10),
                        Text('Region: $region'),
                        SizedBox(height: 10),
                        Text('Subregion: $subregion'),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
