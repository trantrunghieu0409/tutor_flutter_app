import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/courses/data/models/course.dart';

class CardWithPicture extends StatelessWidget {
  const CardWithPicture({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4,
      child: Column(
        children: [
          course.image,
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: CommonTextStyle.h2Black,
                ),
                Text(
                  course.description,
                  style: CommonTextStyle.bodyBlack,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text("${course.level} - ${course.nLessons} lessons"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
