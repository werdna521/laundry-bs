import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  child: Image.asset('assets/logo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
