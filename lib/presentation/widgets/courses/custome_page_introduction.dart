import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/search_input_field.dart';

class CustomPageIntroduction extends StatelessWidget {
  const CustomPageIntroduction(
      {super.key, required this.searchTextController, required this.onChange});

  final TextEditingController searchTextController;
  final void Function() onChange;

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
              children: [
                const Text(
                  "Discover Courses",
                  style: CommonTextStyle.h1Second,
                ),
                SearchInputField(
                  controller: searchTextController,
                  onChange: onChange,
                ),
              ],
            ),
          )
        ]),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.",
          style: CommonTextStyle.bodySecond,
        ),
      ],
    );
  }
}
