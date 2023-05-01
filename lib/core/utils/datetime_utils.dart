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

  static String formatTimeRangeDateTime(DateTime startTime, DateTime endTime) {
    return "${formatTimeOfDay(TimeOfDay.fromDateTime(startTime))} - ${formatTimeOfDay(TimeOfDay.fromDateTime(endTime))}";
  }

  static String formatHourMinute(int minutes) {
    return "${(minutes / 60).floor()} hours ${minutes.remainder(60)} minutes";
  }

  static String formatTimeAgo(
      {required DateTime time, bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(time);
    if ((difference.inDays / 7).floor() == 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
