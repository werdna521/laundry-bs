import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';

class Section extends StatelessWidget {
  final title;
  final child;
  final buttonText;
  final onPress;

  const Section({
    @required this.title,
    @required this.child,
    this.buttonText,
    this.onPress,
  });

  List<Widget> _buildRow(BuildContext context) {
    final List<Widget> builder = [
      Text(
        title,
        style: AntiTheme.headline2(context),
      ),
    ];

    if (buttonText != null)
      builder.add(FlatButton(
        textColor: Colors.blue[300],
        onPressed: onPress,
        child: Text(buttonText),
      ));

    return builder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildRow(context),
            ),
          ),
          Container(child: child),
        ],
      ),
    );
  }
}
