import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/domain/entities/topic_request.dart';
import 'package:tutor_flutter_app/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/presentation/widgets/course_detail/section.dart';
import 'package:tutor_flutter_app/presentation/widgets/course_detail/text_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key, required this.course});

  final CourseEntity course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(header: AppLocalizations.of(context)!.overview, children: [
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: AppLocalizations.of(context)!.why_course,
              description: course.reason),
          const SizedBox(
            height: 8,
          ),
          TextSection(
              icon: const FaIcon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.red,
              ),
              title: AppLocalizations.of(context)!.what_will_do,
              description: course.purpose),
        ]),
        Section(
          header: AppLocalizations.of(context)!.exp,
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
          header: AppLocalizations.of(context)!.course_len,
          children: [
            TextSection(
                icon: const FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.blue,
                ),
                title:
                    "${course.topics.length} ${AppLocalizations.of(context)!.topics}"),
          ],
        ),
        Section(header: AppLocalizations.of(context)!.list_topic, children: [
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
