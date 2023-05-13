import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/domain/entities/history/past_history_entity.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/avatar_info.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_outline_button.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.tutor});

  final PastHistoryEntity tutor;

  @override
  Widget build(BuildContext context) {
    var dateFormatted = DateFormat("EEE, dd MMM yy").format(DateTime.now());

    return Card(
      elevation: 4,
      color: CommonColor.lightBlue,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            dateFormatted,
            style: CommonTextStyle.h2Second,
          ),
          Text(
            DateTimeUtils.formatTimeAgo(time: DateTime.parse(tutor.startTime)),
            style: CommonTextStyle.bodySecond,
          ),
          const SizedBox(
            height: 16,
          ),
          AvatarInfo(tutor: tutor.tutorInfo),
          const SizedBox(
            height: 16,
          ),
          BorderContainer(
              child: Text(
            "Lesson Time: ${DateTimeUtils.formatTimeRangeDateTime(DateTime.parse(tutor.startTime), DateTime.parse(tutor.endTime))}",
            style: CommonTextStyle.h3Second,
          )),
          const SizedBox(
            height: 16,
          ),
          BorderContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Request for lesson",
                style: CommonTextStyle.h3Second,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                tutor.tutorInfo.studentRequest ?? "No request yet!",
                style: CommonTextStyle.bodyItalicSecond,
              )
            ],
          )),
          BorderContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Reviews",
                style: CommonTextStyle.h3Second,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Tutor haven't reviewed yet",
                style: CommonTextStyle.bodyItalicSecond,
              )
            ],
          )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BorderOutlineButton(
                    labelText: "Report", icon: Icons.report),
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
