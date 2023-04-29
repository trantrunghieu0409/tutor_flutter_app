import 'package:flutter/material.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatTimeOfDay(TimeOfDay pickedTime) {
    return '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
  }

  static String formatScheduleTime(int time) {
    return formatTimeOfDay(TimeOfDay.fromDateTime(
        DateTime.fromMicrosecondsSinceEpoch(time * 1000, isUtc: true)
            .toLocal()));
  }

  static int getTimestamp(DateTime dateTime) {
    return (dateTime.toUtc().microsecondsSinceEpoch / 1000).round();
  }

  static String formatTimeRange(int startTimestamp, int endTimestamp) {
    return "${DateTimeUtils.formatScheduleTime(startTimestamp)} - ${DateTimeUtils.formatScheduleTime(endTimestamp)}";
  }
}
