import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class CardWithPicture extends StatelessWidget {
  const CardWithPicture(
      {super.key,
      this.cover,
      required this.title,
      required this.description,
      required this.footer,
      this.callback});

  final Image? cover;
  final String title;
  final String description;
  final Widget footer;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: InkWell(
        onTap: callback,
        child: Column(
          children: [
            cover ?? const SizedBox(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CommonTextStyle.h2Second,
                  ),
                  Text(
                    description,
                    style: CommonTextStyle.bodySecond,
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
      ),
    );
  }
}
