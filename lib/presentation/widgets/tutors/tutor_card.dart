import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_icon_outline.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/chip_list_readonly.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/nation_with_flag.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/pages/tutor_detail_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/stars_rating.dart';

class TutorCard extends ConsumerStatefulWidget {
  const TutorCard({super.key, required this.tutor});

  final TutorEntity tutor;

  @override
  ConsumerState<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends ConsumerState<TutorCard> {
  @override
  Widget build(BuildContext context) {
    final TutorEntity tutor = widget.tutor;
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, TutorDetailPage.routeName,
              arguments: tutor);
        },
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: FadeInImage(
                            placeholder:
                                Image.asset(ImageUtils.defaultImagePath).image,
                            image: tutor.getAvatar().image)
                        .image,
                  ),
                ),
                Positioned(
                  right: 80,
                  top: 48,
                  child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          tutor.toggleFavorite();
                        });
                        ref
                            .read(tutorsProvider.notifier)
                            .toggleFavorite(tutor.userId);
                      },
                      icon: tutor.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_outline,
                              color: Colors.red),
                      label: const Text("")),
                ),
              ],
            ),
            Text(
              tutor.name,
              style: CommonTextStyle.h2Black,
            ),
            NationWithFlag(
              nation: tutor.getCountry(),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 16,
            ),
            StarsRating(nStars: tutor.stars),
            const SizedBox(
              height: 16,
            ),
            ChipListReadOnly(chipTextList: tutor.specialtyList),
            const SizedBox(
              height: 16,
            ),
            Text(
              tutor.bio,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                ButtonIconOutline(
                    labelText: "Book",
                    icon: Icon(Icons.calendar_today_outlined))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
