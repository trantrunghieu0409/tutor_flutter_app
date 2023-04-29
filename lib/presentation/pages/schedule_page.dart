import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/presentation/providers/history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/schedule/schedule_card.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});
  static const routeName = '/schedule';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
        child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: [
        PageIntroduction(
          title: "Schedule",
          description:
              "You can track when the meeting starts, join the meeting with one click or cancel the meeting before 2 hours",
          image: SvgPicture.asset(
            "assets/images/schedule_picture.svg",
            semanticsLabel: "history_picture",
            width: 140,
          ),
        ),
        ..._buidHistoryCardList(ref),
      ],
    ));
  }

  List<Widget> _buidHistoryCardList(WidgetRef ref) {
    var tutors = ref.watch(historyProvider);

    return List<Widget>.generate(tutors.length,
        (index) => ScheduleCard(tutor: tutors[index], time: tutors[index].date));
  }
}
