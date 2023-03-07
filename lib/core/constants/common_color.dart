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
}
