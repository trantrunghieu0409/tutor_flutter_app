import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static DateTime getDateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
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
      {required BuildContext context, required DateTime time}) {
    final date2 = DateTime.now();
    final difference = date2.difference(time);
    if ((difference.inDays / 7).floor() == 1) {
      return AppLocalizations.of(context)!.last_week;
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ${AppLocalizations.of(context)!.day_ago}';
    } else if (difference.inDays >= 1) {
      return AppLocalizations.of(context)!.yesterday;
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} ${AppLocalizations.of(context)!.hour_ago}';
    } else if (difference.inHours >= 1) {
      return AppLocalizations.of(context)!.one_hour_ago;
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} ${AppLocalizations.of(context)!.minute_ago}';
    } else if (difference.inMinutes >= 1) {
      return AppLocalizations.of(context)!.one_minute_ago;
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} ${AppLocalizations.of(context)!.second_ago}';
    } else {
      return AppLocalizations.of(context)!.just_now;
    }
  }
}
