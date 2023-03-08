import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({super.key, required this.tutor});
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
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
                        : const Icon(Icons.favorite_outline, color: Colors.red),
                    label: const Text("")),
              ),
            ],
          ),
          Text(
            tutor.name,
            style: CommonTextStyle.h2Black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tutor.nation.getImage(),
              const SizedBox(
                width: 4,
              ),
              Text(
                tutor.nation.name,
                style: CommonTextStyle.bodyBlack,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
              spacing: 4,
              children: tutor.stars > 0
                  ? List<Icon>.generate(
                      tutor.stars,
                      (index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ))
                  : [
                      const Text("No reviews yet!",
                          style: CommonTextStyle.bodyItalicBlack)
                    ]),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            child: Column(children: <Widget>[
              Wrap(
                spacing: 4.0,
                children: List<Widget>.generate(
                  tutor.categories.length,
                  (int index) {
                    return ChoiceChip(
                      label: Text(tutor.categories[index]),
                      selectedColor: const Color.fromARGB(255, 228, 237, 244),
                      selected: true,
                      onSelected: (bool value) => {},
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.blue),
                    );
                  },
                ).toList(),
              )
            ]),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today_outlined),
                label: const Text("Book"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.blue)))),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
