import 'package:flutter/material.dart';

class CommonTextStyle {
  CommonTextStyle._();

  static const h1 =
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);

  static const h2 = TextStyle(fontSize: 20, color: Colors.white);
  static const subtitle = TextStyle(fontSize: 16, color: Colors.yellow);
  static const body = TextStyle(fontSize: 16, color: Colors.white);

  static const h1Second = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

  static const h2Second = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  static const h3Second = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static const bodySecond = TextStyle(fontSize: 16);
  static const bodyItalicSecond =
      TextStyle(fontSize: 16, fontStyle: FontStyle.italic);
}
