import 'package:flutter/material.dart';
import 'package:app/components/card.dart';

class QueueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntiCard(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        QueueNumberIndicator(),
        Container(
          height: 20.0,
          child: VerticalDivider(
            color: Colors.grey[850],
            width: 16.0,
          ),
        ),
        QueueNumberIndicator(),
      ],
    ));
  }
}

class QueueNumberIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Queue No'),
          Text('5'),
        ],
      ),
    );
  }
}
