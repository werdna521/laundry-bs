import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final onTap;

  const FAB({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        color: Theme.of(context).primaryColor,
        child: Text('+ ADD QUEUE'),
      ),
    );
  }
}
