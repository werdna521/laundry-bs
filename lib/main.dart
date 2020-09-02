import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';

final kTheme = ThemeData(
  primaryColor: Colors.blue[300],
  fontFamily: 'Rubik',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 36.0,
      color: Colors.grey[850],
    ),
    headline6: TextStyle(
      fontSize: 14.0,
      color: Colors.grey[850],
    ),
  ),
);

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kTheme,
      home: HomeScreen(),
    );
  }
}
