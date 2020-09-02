import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';
import 'package:app/components/card.dart';

class CounterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntiCard(
      child: SizedBox(
        width: 132.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Counter 1', style: AntiTheme.headline6(context)),
            SizedBox(height: 4.0),
            Text('1', style: AntiTheme.headline1(context)),
          ],
        ),
      ),
    );
  }
}
