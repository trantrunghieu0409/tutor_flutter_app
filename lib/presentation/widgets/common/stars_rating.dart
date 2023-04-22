import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class StarsRating extends StatelessWidget {
  const StarsRating({super.key, required this.nStars});
  final int nStars;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 2,
        children: nStars > 0
            ? List<Icon>.generate(
                nStars,
                (index) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ))
            : [
                const Text("No reviews yet!",
                    style: CommonTextStyle.bodyItalicBlack)
              ]);
  }
}
