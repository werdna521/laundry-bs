import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';
import 'package:flutter/foundation.dart';

class Section extends StatelessWidget {
  final title;
  final child;
  final buttonText;
  final onPress;
  final showUpButton;

  const Section({
    @required this.title,
    @required this.child,
    this.buttonText,
    this.onPress,
    this.showUpButton = false,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: showUpButton
                      ? IconButton(
                          splashRadius: 20.0,
                          icon: Icon(
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: Colors.grey[850],
                          ),
                          onPressed: () {
                            debugPrint(Theme.of(context).platform.toString());
                            Navigator.pop(context);
                          },
                        )
                      : SizedBox(
                          height: 0.0,
                          width: 0.0,
                        ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildRow(context),
                  ),
                ),
              ],
            ),
          ),
          Container(child: child),
        ],
      ),
    );
  }
}
