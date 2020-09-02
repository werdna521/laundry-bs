import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';
import 'package:app/components/card.dart';

class CounterCard extends StatelessWidget {
  final counterNumber;
  final counterQueueNumber;

  CounterCard({this.counterNumber, this.counterQueueNumber});

  @override
  Widget build(BuildContext context) {
    return AntiCard(
      child: SizedBox(
        width: 132.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Counter ${counterNumber ?? 0}',
              style: AntiTheme.headline6(context),
            ),
            SizedBox(height: 4.0),
            Text(
              counterQueueNumber ?? 'n/a',
              style: AntiTheme.headline1(context),
            ),
          ],
        ),
      ),
    );
  }
}
