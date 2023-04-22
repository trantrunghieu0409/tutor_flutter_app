import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/presentation/widgets/schedule/schedule_card.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});
  static const routeName = '/schedule';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            PageIntroduction(
              title: "Schedule",
              description:
                  "Here is a list of the sessions you have booked\nYou can track when the meeting starts, join the meeting with one click",
              image: SvgPicture.asset(
                "assets/images/schedule_picture.svg",
                semanticsLabel: "history_picture",
                width: 140,
              ),
            ),
            ..._buidHistoryCardList(),
          ],
        ));
  }

  List<Widget> _buidHistoryCardList() {
    return List<Widget>.generate(tutors.length,
        (index) => ScheduleCard(tutor: tutors[index], time: DateTime.now()));
  }
}
