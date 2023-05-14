import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/button_icon_outline.dart';
import 'package:tutor_flutter_app/core/common_widgets/chip_list_readonly.dart';
import 'package:tutor_flutter_app/core/common_widgets/nation_with_flag.dart';
import 'package:tutor_flutter_app/core/common_widgets/stars_rating.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutor_list/data/models/tutor.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/pages/tutor_detail_page.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({super.key, required this.tutor});
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(tutor.avatar),
                  ),
                ),
                Positioned(
                  right: 72,
                  top: 48,
                  child: TextButton.icon(
                      onPressed: () {
                        tutor.isFavorite = !tutor.isFavorite;
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
              nation: tutor.nation,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(
              height: 16,
            ),
            StarsRating(nStars: tutor.stars),
            const SizedBox(
              height: 16,
            ),
            ChipListReadOnly(chipTextList: tutor.categories),
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
