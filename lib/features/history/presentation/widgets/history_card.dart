import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/common_widgets/avatar_info.dart';
import 'package:tutor_flutter_app/core/common_widgets/border_container.dart';
import 'package:tutor_flutter_app/core/common_widgets/border_outline_button.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutor_list/data/models/tutor.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.tutor, required this.time});

  final Tutor tutor;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    var dateFormatted = DateFormat("EEE, dd MMM yy").format(time);

    return Card(
      elevation: 4,
      color: CommonColor.lightBlue,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            dateFormatted,
            style: CommonTextStyle.h2Black,
          ),
          const Text(
            "13 hours ago",
            style: CommonTextStyle.bodyBlack,
          ),
          const SizedBox(
            height: 16,
          ),
          AvatarInfo(tutor: tutor),
          const SizedBox(
            height: 16,
          ),
          const BorderContainer(
              child: Text(
            "Lesson Time: 08:00 - 08:25",
            style: CommonTextStyle.h3Black,
          )),
          const SizedBox(
            height: 16,
          ),
          const BorderContainer(
              child: Text(
            "No request for lesson",
            style: CommonTextStyle.bodyBlack,
          )),
          const BorderContainer(
              child: Text(
            "Tutor haven't reviewed yet",
            style: CommonTextStyle.bodyBlack,
          )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BorderOutlineButton(labelText: "Report", icon: Icons.report),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text("Add a rating"),
                  icon: const Icon(Icons.rate_review),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
