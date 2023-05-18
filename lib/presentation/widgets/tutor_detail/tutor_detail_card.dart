import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/nation_with_flag.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/stars_rating.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/buttons_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorDetailCard extends ConsumerStatefulWidget {
  const TutorDetailCard({super.key, required this.tutor});
  final TutorEntity tutor;

  @override
  ConsumerState<TutorDetailCard> createState() => _TutorDetailCardState();
}

class _TutorDetailCardState extends ConsumerState<TutorDetailCard> {
  @override
  void initState() {
    _fetchReview();
    super.initState();
  }

  _fetchReview() async {
    widget.tutor.feedbacks =
        await ref.read(tutorsProvider.notifier).getReviews(widget.tutor.userId);
    setState(() {
      log("${widget.tutor.feedbacks.length}");
    });
  }

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
                backgroundImage: widget.tutor.getAvatar().image,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tutor.name,
                    style: CommonTextStyle.h2Second,
                  ),
                  Row(
                    children: [
                      StarsRating(nStars: widget.tutor.stars),
                      Text(
                        "(${widget.tutor.feedbacks.length} reviews)",
                        style: CommonTextStyle.bodyItalicSecond,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  NationWithFlag(
                    nation: widget.tutor.getCountry(),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(widget.tutor.bio),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              AppLocalizations.of(context)!.interests,
              style: CommonTextStyle.bodyItalicSecond,
            ),
          ),
          Text(widget.tutor.interests),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              AppLocalizations.of(context)!.teaching_exp,
              style: CommonTextStyle.bodyItalicSecond,
            ),
          ),
          Text(widget.tutor.experience),
          const SizedBox(
            height: 16,
          ),
          ButtonSection(
            tutor: widget.tutor,
          ),
        ]),
      ),
    );
  }
}
