import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/nation_with_flag.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

import 'button_icon_outline.dart';

class AvatarInfo extends StatelessWidget {
  const AvatarInfo({super.key, required this.tutor});

  final TutorEntity tutor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
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
                  const SizedBox(
                    width: 8,
                  ),
                  NationWithFlag(
                    nation: tutor.country,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ],
          ),
          const ButtonIconOutline(
              labelText: "Inbox", icon: Icon(Icons.message)),
        ],
      ),
    );
  }
}
