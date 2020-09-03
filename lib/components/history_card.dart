import 'package:flutter/material.dart';
import 'package:app/components/card.dart';
import 'package:app/text_theme.dart';

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntiCard(
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.green[300],
          ),
          SizedBox(width: 16.0),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'August 12, 2020',
                style: AntiTheme.headline6(context),
              ),
              Text('Taken at August 18, 2020'),
            ],
          ),
        ],
      ),
    );
  }
}
