import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    var from = DateTime.now().toUtc().toLocal();
    var to = from.add(const Duration(minutes: 25));

    var dateFormatted = DateFormat("EEE, dd MMM yy").format(from);
    var fromTimeFormatted = DateFormat.Hm().format(from);
    var toTimeFormatted = DateFormat.Hm().format(to);

    return Column(
      children: [
        Text(
          dateFormatted,
          style: CommonTextStyle.h2,
        ),
        Text(
          "$fromTimeFormatted - $toTimeFormatted",
          style: CommonTextStyle.h2,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "(starts in 09:18:08)",
          style: CommonTextStyle.subtitle,
        )
      ],
    );
  }
}
