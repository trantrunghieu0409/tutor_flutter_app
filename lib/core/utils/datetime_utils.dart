import 'package:flutter/material.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatTimeOfDay(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
