import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/section.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/text_section.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';
import 'package:tutor_flutter_app/features/tutorList/presentation/widgets/tutor_list.dart';

class DetailSection extends StatelessWidget {
  const DetailSection(
      {super.key,
      required this.reason,
      required this.purpose,
      required this.level,
      required this.topics,
      required this.suggestedTutors});

  final String reason;
  final String purpose;
  final String level;
  final List<Topic> topics;
  final List<Tutor> suggestedTutors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(header: "Overview", children: [
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: "Why take this course",
              description: reason),
          const SizedBox(
            height: 8,
          ),
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: "What will you able to do",
              description: purpose),
        ]),
        Section(
          header: "Experience level",
          children: [
            TextSection(
                icon: const FaIcon(
                  FontAwesomeIcons.userGraduate,
                  color: Colors.blue,
                ),
                title: level)
          ],
        ),
        Section(
          header: "Course Length",
          children: [
            TextSection(
                icon: const FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.blue,
                ),
                title: "${topics.length} topics"),
          ],
        ),
        Section(header: "List Topics", children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List<Widget>.generate(
                topics.length,
                (index) => Container(
                      padding: const EdgeInsets.all(32),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                          color: CommonColor.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        "${index + 1}. ${topics[index].name}",
                        style: CommonTextStyle.h3Black,
                      ),
                    )),
          )
        ]),
        Section(
          header: "Suggested Tutors",
          children: [
            TutorList(
              tutorList: suggestedTutors,
            )
          ],
        ),
      ],
    );
  }
}
