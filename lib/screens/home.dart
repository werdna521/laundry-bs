import 'package:flutter/material.dart';
import 'package:app/components/queue_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48.0,
                  height: 48.0,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(height: 16.0),
                QueueCard(),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
