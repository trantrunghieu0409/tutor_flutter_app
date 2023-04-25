import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/nation_with_flag.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/stars_rating.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/buttons_section.dart';

class TutorDetailCard extends StatelessWidget {
  const TutorDetailCard({super.key, required this.tutor});
  final TutorEntity tutor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 44,
                backgroundImage: tutor.getAvatar().image,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tutor.name,
                    style: CommonTextStyle.h2Black,
                  ),
                  StarsRating(nStars: tutor.stars),
                  const SizedBox(
                    height: 8,
                  ),
                  NationWithFlag(
                    nation: tutor.getCountry(),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(tutor.bio),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Interests",
              style: CommonTextStyle.bodyItalicBlack,
            ),
          ),
          Text(tutor.interests),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Teaching experience",
              style: CommonTextStyle.bodyItalicBlack,
            ),
          ),
          Text(tutor.experience),
          const SizedBox(
            height: 16,
          ),
          ButtonSection(
            tutor: tutor,
          ),
        ]),
      ),
    );
  }
}
