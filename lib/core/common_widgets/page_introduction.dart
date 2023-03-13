import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class PageIntroduction extends StatelessWidget {
  PageIntroduction(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  Widget image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CommonTextStyle.h1Black,
              ),
              Text(description),
            ],
          ),
        )
      ],
    );
  }
}
