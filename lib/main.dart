import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF880E4F)));
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[300],
        ),
        home: Scaffold(
          appBar: AppBar(toolbarHeight: 0.0),
          backgroundColor: Colors.grey[100],
          body: Container(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Text('Hi, this is me.'),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
