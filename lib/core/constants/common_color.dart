import 'package:flutter/material.dart';

class CommonColor {
  CommonColor._();

  static const linearBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xff0C3DDF),
      Color(0xff05179D),
    ],
    tileMode: TileMode.mirror,
  );

  static const lightBlue = Color.fromRGBO(241, 241, 241, 1);
  static const lightGrey = Color.fromARGB(0, 27, 115, 44);
}
