import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/chip_list_readonly.dart';
import 'package:tutor_flutter_app/core/common_widgets/video_player.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/tutor_detail_card.dart';

class TutorInfo extends StatelessWidget {
  const TutorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var tutor = tutors[0];

    return ListView(
      children: [
        tutor.videoLink == null
            ? const SizedBox()
            : VideoSection(link: tutor.videoLink!),
        TutorDetailCard(tutor: tutor),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Specialities",
                style: CommonTextStyle.h2Black,
              ),
              ChipListReadOnly(chipTextList: tutor.categories),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Suggested courses",
                style: CommonTextStyle.h2Black,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Basic Conversation Topics",
                      style: CommonTextStyle.bodyBlack,
                    ),
                    Text(
                      "Life in the Internet Age",
                      style: CommonTextStyle.bodyBlack,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
