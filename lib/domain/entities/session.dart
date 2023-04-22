import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';

class Session {
  Session({required this.from, required this.to});

  TimeOfDay from;
  TimeOfDay to;

  @override
  String toString() {
    return "${DateTimeUtils.formatTimeOfDay(from)} - ${DateTimeUtils.formatTimeOfDay(to)}";
  }
}
