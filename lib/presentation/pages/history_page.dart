import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/common_scaffold.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/page_introduction.dart';
import 'package:tutor_flutter_app/presentation/widgets/history/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: [
        PageIntroduction(
          title: "History",
          description:
              "The following is a list of lessons you have attended\nYou can review the details of the lessons you have attended",
          image: SvgPicture.asset(
            "assets/images/history_picture.svg",
            semanticsLabel: "history_picture",
          ),
        ),
        ..._buidHistoryCardList(),
      ],
    ));
  }

  List<Widget> _buidHistoryCardList() {
    var tutors = [];

    return List<Widget>.generate(tutors.length,
        (index) => HistoryCard(tutor: tutors[index], time: DateTime.now()));
  }
}
