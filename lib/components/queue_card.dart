import 'package:flutter/material.dart';
import 'package:app/components/card.dart';

class QueueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntiCard(
        child: Column(
      children: [
        Text('Hello'),
        Text('World'),
      ],
    ));
  }
}
