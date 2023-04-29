import 'package:flutter/material.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatTimeOfDay(TimeOfDay pickedTime) {
    return '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
  }

  static String formatDuration(Duration duration) {
    return "${duration.inHours.toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}";
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

  static String formatHourMinute(int minutes) {
    return "${(minutes / 60).floor()} hours ${minutes.remainder(60)} minutes";
  }
}
