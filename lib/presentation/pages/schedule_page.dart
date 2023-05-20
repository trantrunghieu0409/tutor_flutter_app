import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/empty_widget.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/schedule/schedule_card.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  static const routeName = '/schedule';

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  late List<TutorHistoryEntity> tutors;

  @override
  Widget build(BuildContext context) {
    tutors = ref.watch(historyProvider);

    return CommonScaffold(
        child: RefreshIndicator(
      onRefresh: _pullRefresh,
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
          ..._buidHistoryCardList(),
        ],
      ),
    ));
  }

  Future<void> _pullRefresh() async {
    ref.watch(historyProvider.notifier).getHistory();
  }

  List<Widget> _buidHistoryCardList() {
    return tutors.isEmpty
        ? [
            const EmptyWidget(
                text:
                    "You do not have any class yet!\nTry to book a class to start learning today.")
          ]
        : List<Widget>.generate(
            tutors.length,
            (index) =>
                ScheduleCard(tutor: tutors[index], time: tutors[index].date));
  }
}
