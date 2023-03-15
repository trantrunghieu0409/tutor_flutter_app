import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/common_widgets/avatar_info.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/common_widgets/primary_button.dart';
import 'package:tutor_flutter_app/core/utils/meeting_utils.dart';
import 'package:tutor_flutter_app/features/schedule/presentation/widgets/session_list.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';
import 'package:tutor_flutter_app/features/video_call/presentation/widgets/meeting_webview.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.tutor, required this.time});

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
          Text(
            "${tutor.sessions.length} consecutives lesson",
            style: CommonTextStyle.bodyBlack,
          ),
          const SizedBox(
            height: 16,
          ),
          AvatarInfo(tutor: tutor),
          const SizedBox(
            height: 16,
          ),
          SessionList(
            tutor: tutor,
          ),
          PrimaryButton(
            text: "Go to meeting",
            onPressed: tutor.sessions.isEmpty
                ? null
                : () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MeetingWebView(
                                  meetingUrl:
                                      fetchInstantMeetingUrl(tutor.name))))
                    },
          )
        ]),
      ),
    );
  }
}
