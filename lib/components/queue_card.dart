import 'package:flutter/material.dart';
import 'package:app/components/card.dart';
import 'package:app/text_theme.dart';

class QueueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AntiCard(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QueueNumberIndicator(
            title: 'Your Queue No.',
            content: '10',
          ),
          Container(
            height: 48.0,
            child: VerticalDivider(
              color: Colors.grey[850],
              width: 8.0,
            ),
          ),
          QueueNumberIndicator(
            title: 'Current Queue No.',
            content: '2',
          ),
        ],
      ),
    );
  }
}

class QueueNumberIndicator extends StatelessWidget {
  final title;
  final content;
  final color;

  const QueueNumberIndicator({
    @required this.title,
    @required this.content,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AntiTheme.headline6(context),
          ),
          Text(
            content,
            style: AntiTheme.headline1(context).copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
