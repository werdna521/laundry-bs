import 'package:flutter/material.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/history.dart';

final kTheme = ThemeData(
  primaryColor: Colors.blue[300],
  fontFamily: 'Rubik',
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 36.0,
      color: Colors.grey[850],
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      color: Colors.grey[850],
    ),
    headline6: TextStyle(
      fontSize: 14.0,
      color: Colors.grey[850],
    ),
    caption: TextStyle(
      fontSize: 12.0,
      color: Colors.grey[500],
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/history': (context) => HistoryScreen(),
      },
    );
  }
}
