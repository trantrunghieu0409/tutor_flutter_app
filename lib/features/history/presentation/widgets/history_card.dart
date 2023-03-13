import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/common_widgets/avatar_info.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';

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
          _buildCustomContainer(const Text(
            "Lesson Time: 08:00 - 08:25",
            style: CommonTextStyle.h3Black,
          )),
          const SizedBox(
            height: 16,
          ),
          _buildCustomContainer(const Text(
            "No request for lesson",
            style: CommonTextStyle.bodyBlack,
          )),
          _buildCustomContainer(const Text(
            "Tutor haven't reviewed yet",
            style: CommonTextStyle.bodyBlack,
          )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.white,// background
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                        color: Colors.red), // foreground border
                  ),
                  onPressed: () => {},
                  label: const Text(
                    "Report",
                    style: CommonTextStyle.bodyBlack,
                  ),
                  icon: const Icon(Icons.report),
                ),
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

  Widget _buildCustomContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
          color: Colors.white),
      child: child,
    );
  }
}
