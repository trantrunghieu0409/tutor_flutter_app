import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class TextSection extends StatelessWidget {
  const TextSection(
      {super.key, required this.icon, required this.title, this.description});
  final Widget icon;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: CommonTextStyle.h3Second,
            ),
          ],
        ),
        description != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: Text(description!),
              )
            : const SizedBox()
      ],
    );
  }
}
