import 'package:flutter/material.dart';

class AntiCard extends StatelessWidget {
  final child;

  const AntiCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: child,
    );
  }
}
