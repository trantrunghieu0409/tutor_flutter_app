import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/nation_with_flag.dart';
import 'package:tutor_flutter_app/core/common_widgets/stars_rating.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/widgets/buttons_section.dart';

import '../../../../core/constants/common_text_style.dart';
import '../../../tutor_list/data/models/tutor.dart';

class TutorDetailCard extends StatelessWidget {
  const TutorDetailCard({super.key, required this.tutor});
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 44,
                backgroundImage: NetworkImage(tutor.avatar),
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
                    nation: tutor.nation,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            tutor.description,
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 16,
          ),
          const ButtonSection(),
        ]),
      ),
    );
  }
}
