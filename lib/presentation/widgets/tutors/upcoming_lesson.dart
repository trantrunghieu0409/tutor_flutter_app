import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/domain/entities/common/failure_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/presentation/pages/meeting_page.dart';
import 'package:tutor_flutter_app/presentation/providers/helper_future_providers.dart';
import 'package:tutor_flutter_app/presentation/providers/history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_icon_outline.dart';

import 'schedule.dart';

class UpcommingLesson extends ConsumerStatefulWidget {
  const UpcommingLesson({super.key});

  @override
  ConsumerState<UpcommingLesson> createState() => _UpcommingLessonState();
}

class _UpcommingLessonState extends ConsumerState<UpcommingLesson> {
  @override
  Widget build(BuildContext context) {
    List<TutorHistoryEntity> tutors = ref.watch(historyProvider);
    AsyncValue<int> total = ref.watch(totalProvider);

    if (tutors.isEmpty) return const SizedBox();
    var schedule = tutors[0].scheduleHitories.first;
    var meetingLink = tutors[0].histories.first.studentMeetingLink;

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: const BoxDecoration(gradient: CommonColor.linearBlue),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Upcoming lesson",
                style: CommonTextStyle.h1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Schedule(
                  date: tutors[0].date,
                  startTimestamp: schedule.startTimestamp,
                  endTimestamp: schedule.endTimestamp,
                  onEndClass: () {
                    ref.watch(historyProvider.notifier).getHistory();
                  },
                ),
                ButtonIconOutline(
                    labelText: "Enter Meeting",
                    icon: const FaIcon(FontAwesomeIcons.youtube),
                    callback: () {
                      log("Pressing");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MeetingPage(
                                  tutorInfo: tutors.first.tutorInfo,
                                  startTimestamp: schedule.startTimestamp,
                                  endTimestamp: schedule.endTimestamp,
                                  meetingUrl: meetingLink)));
                    })
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            total.when(
                data: (total) => Text(
                      "Total lesson time is ${DateTimeUtils.formatHourMinute(total)}",
                      style: CommonTextStyle.body,
                      textAlign: TextAlign.center,
                    ),
                error: (Object error, StackTrace stackTrace) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(error is FailureEntity
                          ? error.error
                          : error.toString()),
                    ));
                  });
                  return const SizedBox();
                },
                loading: () => const SizedBox())
          ],
        ));
  }
}
