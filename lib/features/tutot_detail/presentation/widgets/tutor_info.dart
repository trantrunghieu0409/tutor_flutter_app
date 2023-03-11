import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/video_player.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/tutor_detail_card.dart';

class TutorInfo extends StatelessWidget {
  const TutorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var tutor = tutors[0];

    return ListView(
      children: [
        // tutor.videoLink == null
        //     ? const SizedBox()
        //     : VideoSection(title: tutor.name, link: tutor.videoLink!),
        TutorDetailCard(tutor: tutor),
      ],
    );
  }
}
