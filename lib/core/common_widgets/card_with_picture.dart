import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class CardWithPicture extends StatelessWidget {
  const CardWithPicture(
      {super.key,
      required this.cover,
      required this.title,
      required this.description,
      required this.footer});

  final Image cover;
  final String title;
  final String description;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: Column(
        children: [
          cover,
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CommonTextStyle.h2Black,
                ),
                Text(
                  description,
                  style: CommonTextStyle.bodyBlack,
                ),
                const SizedBox(
                  height: 32,
                ),
                footer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
