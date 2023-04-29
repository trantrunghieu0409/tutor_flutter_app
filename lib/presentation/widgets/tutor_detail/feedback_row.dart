import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/first_info_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/stars_rating.dart';

class FeedbackRow extends StatelessWidget {
  const FeedbackRow({super.key, required this.feedback});

  final FeedbackEntity feedback;

  @override
  Widget build(BuildContext context) {
    final FirstInfoEntity firstInfo = feedback.firstInfo;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: firstInfo.getAvatar().image,
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstInfo.name,
                style: CommonTextStyle.h3Black,
                softWrap: true,
              ),
              StarsRating(nStars: feedback.rating.round()),
              Text(
                feedback.content.isNotEmpty
                    ? feedback.content
                    : "No comment yet!",
                style: CommonTextStyle.bodyItalicBlack,
                overflow: TextOverflow.clip,
                softWrap: true,
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ],
    );
  }
}
