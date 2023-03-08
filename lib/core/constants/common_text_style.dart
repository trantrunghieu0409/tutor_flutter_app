import 'package:flutter/material.dart';

class CommonTextStyle {
  CommonTextStyle._();

  static const h1 =
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);

  static const h2 = TextStyle(fontSize: 20, color: Colors.white);
  static const subtitle = TextStyle(fontSize: 16, color: Colors.yellow);
  static const body = TextStyle(fontSize: 16, color: Colors.white);

  static const h1Black =
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);

  static const h2Black =
      TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600);
  static const bodyBlack = TextStyle(fontSize: 16, color: Colors.black);
  static const bodyItalicBlack =
      TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.italic);
}
