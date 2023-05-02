import 'package:flutter/material.dart';

class SnackBarHelpers {
  static showSnackBarSuccess(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.green,
    ));
  }

   static showSnackBarFail(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ));
  }
}
