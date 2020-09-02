import 'package:flutter/material.dart';

class AntiTheme {
  static TextStyle headline1(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline1
        .copyWith(fontWeight: FontWeight.w300);
  }

  static TextStyle headline6(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.w500);
  }
}
