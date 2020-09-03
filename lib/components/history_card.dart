import 'package:flutter/material.dart';
import 'package:app/components/card.dart';
import 'package:app/models/history.dart';
import 'package:app/text_theme.dart';

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({@required this.history});

  @override
  Widget build(BuildContext context) {
    return AntiCard(
      child: Row(
        children: [
          Icon(
            history.taken ? Icons.check_circle_outline : Icons.clear,
            color: history.taken ? Colors.green[300] : Colors.red[300],
          ),
          SizedBox(width: 16.0),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                history.date,
                style: AntiTheme.headline6(context),
              ),
              Text(history.taken
                  ? 'Taken at ${history.takenDate}'
                  : 'Not taken'),
            ],
          ),
        ],
      ),
    );
  }
}
