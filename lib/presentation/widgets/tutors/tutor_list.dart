import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutors/tutor_card.dart';

class TutorList extends StatelessWidget {
  const TutorList({super.key, required this.tutorList});
  final List<TutorEntity> tutorList;

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
