import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      routes: routes,
    );
  }
}

class home extends StatefulWidget {
  static const String routeName = "home";

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<String> posts = [];

  void _addPost(String postText) {
    setState(() {
      posts.add(postText);
      _textFieldController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shape: const Border(bottom: BorderSide(color: Colors.white, width: 2)),
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Handle user icon click
                userprofile(context); // Call the function with context
              },
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "home",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          PostInput(onAddPost: _addPost),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Post(text: posts[index]),
                    SizedBox(height: 5.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
