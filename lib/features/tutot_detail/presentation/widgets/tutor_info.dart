import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/video_player.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/booking_calendar.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/tutor_detail_card.dart';

class TutorInfo extends StatelessWidget {
  const TutorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var tutor = tutors[0];

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        tutor.videoLink == null
            ? const SizedBox(
                height: 20,
              )
            : VideoSection(link: tutor.videoLink!),
        TutorDetailCard(tutor: tutor),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Make an Appoinment",
            style: CommonTextStyle.h2Black,
          ),
        ),
        const BookingCalendar(),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
