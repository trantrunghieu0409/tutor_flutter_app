import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';

class Schedule extends StatefulWidget {
  const Schedule(
      {super.key,
      required this.date,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.onEndClass});
  final DateTime date;
  final int startTimestamp;
  final int endTimestamp;

  final void Function() onEndClass;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Timer? timer;

  @override
  void initState() {
    startTime = DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp);
    endTime = DateTime.fromMillisecondsSinceEpoch(widget.endTimestamp);
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _countDown());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  late Duration remainTime = Duration.zero;
  late DateTime startTime;
  late DateTime endTime;

  @override
  Widget build(BuildContext context) {
    var dateFormatted = DateFormat("EEEE, dd MMM",
            Injector.resolve<SettingsController>().language.locale)
        .format(widget.date);

    return Column(
      children: [
        Text(
          dateFormatted,
          style: CommonTextStyle.h2,
        ),
        Text(
          DateTimeUtils.formatTimeRange(
              widget.startTimestamp, widget.endTimestamp),
          style: CommonTextStyle.h2,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          startTime.compareTo(DateTime.now()) < 0
              ? "(${AppLocalizations.of(context)!.class_time}: ${DateTimeUtils.formatDuration(remainTime)})"
              : "(${AppLocalizations.of(context)!.start} : ${DateTimeUtils.formatDuration(remainTime)})",
          style: CommonTextStyle.subtitle,
        )
      ],
    );
  }

  _countDown() {
    setState(() {
      remainTime = startTime.compareTo(DateTime.now()) < 0
          ? DateTime.now().difference(startTime)
          : startTime.difference(DateTime.now());
    });
    if (endTime.compareTo(DateTime.now()) < 0) {
      widget.onEndClass();
    }
  }
}
