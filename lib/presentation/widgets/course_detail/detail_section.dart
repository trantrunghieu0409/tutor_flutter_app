import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/domain/entities/topic_request.dart';
import 'package:tutor_flutter_app/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/course_detail/section.dart';
import 'package:tutor_flutter_app/presentation/widgets/course_detail/text_section.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key, required this.course});

  final CourseEntity course;

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
              description: course.reason),
          const SizedBox(
            height: 8,
          ),
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: "What will you able to do",
              description: course.purpose),
        ]),
        Section(
          header: "Experience level",
          children: [
            TextSection(
                icon: const FaIcon(
                  FontAwesomeIcons.userGraduate,
                  color: Colors.blue,
                ),
                title: course.getLevel())
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
                title: "${course.topics.length} topics"),
          ],
        ),
        Section(header: "List Topics", children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List<Widget>.generate(
                course.topics.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TopicDetailPage.routeName,
                            arguments: TopicRequest(
                                title: course.name,
                                topics: course.topics,
                                selectedIndex: index));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          "${index + 1}. ${course.topics[index].name}",
                          style: CommonTextStyle.h3Second,
                        ),
                      ),
                    )),
          )
        ]),
      ],
    );
  }
}
