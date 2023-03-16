import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/core/common_widgets/search_input_field.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';

class CustomPageIntroduction extends StatelessWidget {
  const CustomPageIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SvgPicture.asset(
            "assets/images/course_picture.svg",
            semanticsLabel: "course_picture",
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Discover Courses",
                  style: CommonTextStyle.h1Black,
                ),
                SearchInputField(),
              ],
            ),
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.",
          style: CommonTextStyle.bodyBlack,
        ),
      ],
    );
  }
}
