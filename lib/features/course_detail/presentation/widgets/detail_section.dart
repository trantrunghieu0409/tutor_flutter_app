import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/course_detail.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/section.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/text_section.dart';
import 'package:tutor_flutter_app/features/topic_detail/data/models/topic_request.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/widgets/tutor_list.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key, required this.courseDetail});

  final CourseDetail courseDetail;

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
              description: courseDetail.reason),
          const SizedBox(
            height: 8,
          ),
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: "What will you able to do",
              description: courseDetail.purpose),
        ]),
        Section(
          header: "Experience level",
          children: [
            TextSection(
                icon: const FaIcon(
                  FontAwesomeIcons.userGraduate,
                  color: Colors.blue,
                ),
                title: courseDetail.course.level)
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
                title: "${courseDetail.topics.length} topics"),
          ],
        ),
        Section(header: "List Topics", children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List<Widget>.generate(
                courseDetail.topics.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TopicDetailPage.routeName,
                            arguments: TopicRequest(
                                title: courseDetail.course.title,
                                topics: courseDetail.topics,
                                selectedIndex: index));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                            color: CommonColor.lightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          "${index + 1}. ${courseDetail.topics[index].name}",
                          style: CommonTextStyle.h3Black,
                        ),
                      ),
                    )),
          )
        ]),
        Section(
          header: "Suggested Tutors",
          children: [
            TutorList(
              tutorList: courseDetail.suggestedTutors,
            )
          ],
        ),
      ],
    );
  }
}
