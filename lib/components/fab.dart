import 'package:flutter/material.dart';
import 'package:app/text_theme.dart';

class FAB extends StatelessWidget {
  final onTap;

  const FAB({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 4.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: InkWell(
          splashColor: Colors.blue[200],
          borderRadius: BorderRadius.circular(24.0),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            child: Text(
              '+ ADD QUEUE',
              style: AntiTheme.headline6(context).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
