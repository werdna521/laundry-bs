import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[300],
      ),
      home: HomeScreen(),
    );
  }
}
