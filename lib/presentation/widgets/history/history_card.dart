import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/avatar_info.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_outline_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.tutor});

  final TutorHistoryEntity tutor;

  @override
  Widget build(BuildContext context) {
    var dateFormatted = DateFormat("EEEE, dd MMM",
            Injector.resolve<SettingsController>().language.locale)
        .format(tutor.date);
    var sessions = tutor.scheduleHitories;

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
            DateTimeUtils.formatTimeAgo(
                context: context,
                time: DateTimeUtils.getDateTime(sessions.first.startTimestamp)),
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
            "${AppLocalizations.of(context)!.lesson_time} ${DateTimeUtils.formatTimeRange(sessions.last.startTimestamp, sessions.first.endTimestamp)}",
            style: CommonTextStyle.h3Second,
          )),
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
          BorderContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.reviews,
                style: CommonTextStyle.h3Second,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppLocalizations.of(context)!.no_review_tutor,
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
                BorderOutlineButton(
                    labelText: AppLocalizations.of(context)!.report,
                    icon: Icons.report),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(AppLocalizations.of(context)!.rating),
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
