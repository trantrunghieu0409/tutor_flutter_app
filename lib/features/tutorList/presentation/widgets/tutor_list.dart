import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/widgets/tutor_card.dart';

class TutorList extends StatelessWidget {
  const TutorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(
          tutors.length,
          (index) => Column(
                children: [
                  TutorCard(tutor: tutors[index]),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )),
    );
  }
}
