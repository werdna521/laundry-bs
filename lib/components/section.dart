import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';

class Section extends StatelessWidget {
  final title;
  final child;

  const Section({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              title,
              style: AntiTheme.headline2(context),
            ),
          ),
          Container(child: child),
        ],
      ),
    );
  }
}
