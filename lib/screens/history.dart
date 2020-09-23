import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      backgroundColor: Colors.grey[100],
      body: Builder(
        builder: (context) => SafeArea(
          child: const Text('History'),
        ),
      ),
    );
  }
}
