import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class PageIntroduction extends StatelessWidget {
  const PageIntroduction(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final Widget image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CommonTextStyle.h1Second,
              ),
              Text(description),
            ],
          ),
        )
      ],
    );
  }
}
