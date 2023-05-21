import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/avatar_info.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/pages/meeting_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/schedule/session_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.tutor, required this.time});

  final TutorHistoryEntity tutor;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    var dateFormatted = DateFormat("EEEE, dd MMM",
            Injector.resolve<SettingsController>().language.locale)
        .format(time);

    return Card(
      elevation: 4,
      color: SettingUtils.isLightTheme
          ? CommonColor.lightBlue
          : Theme.of(context).secondaryHeaderColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            dateFormatted,
            style: CommonTextStyle.h2Second,
          ),
          Text(
            "${tutor.scheduleHitories.length} ${AppLocalizations.of(context)!.con_lessons}",
            style: CommonTextStyle.bodySecond,
          ),
          const SizedBox(
            height: 16,
          ),
          AvatarInfo(tutor: tutor.tutorInfo),
          const SizedBox(
            height: 16,
          ),
          SessionList(
            tutor: tutor,
          ),
          const SizedBox(
            height: 16,
          ),
          BorderContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.request_for_lesson,
                style: CommonTextStyle.h3Second,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                tutor.tutorInfo.studentRequest ??
                    AppLocalizations.of(context)!.no_request,
                style: CommonTextStyle.bodyItalicSecond,
              )
            ],
          )),
          PrimaryButton(
            text: AppLocalizations.of(context)!.join,
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MeetingPage(
                          tutorInfo: tutor.tutorInfo,
                          startTimestamp: tutor.startTimestamp,
                          endTimestamp: tutor.endTimestamp,
                          meetingUrl: tutor.getCurrentMeeting())))
            },
          ),
        ]),
      ),
    );
  }
}
