import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/widgets/tutor_card.dart';

class TutorList extends StatelessWidget {
  const TutorList({super.key, required this.tutorList});
  final List<Tutor> tutorList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
          tutorList.length,
          (index) => Column(
                children: [
                  TutorCard(tutor: tutorList[index]),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )),
    );
  }
}
