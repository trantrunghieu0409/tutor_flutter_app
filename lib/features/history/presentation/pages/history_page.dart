import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/core/common_widgets/page_introduction.dart';
import 'package:tutor_flutter_app/features/history/presentation/widgets/history_card.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tutor = tutors[0];

    return Scaffold(
        appBar: const CommonAppBar(),
        body: ListView(
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
    return List<Widget>.generate(tutors.length,
        (index) => HistoryCard(tutor: tutors[index], time: DateTime.now()));
  }
}
