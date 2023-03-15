import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/card_with_picture.dart';
import 'package:tutor_flutter_app/core/common_widgets/previous_appbar.dart';
import 'package:tutor_flutter_app/core/common_widgets/primary_button.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/course_detail.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/detail_section.dart';
import 'package:tutor_flutter_app/features/courses/data/models/course.dart';
import 'package:tutor_flutter_app/features/topic_detail/data/models/topic_request.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/pages/topic_detail_page.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});
  static const routeName = '/course-detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CourseDetail;
    onClosePage() => {Navigator.pop(context)};

    Course course = args.course;

    return Scaffold(
        appBar: PreviousAppBar(
          callback: onClosePage,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            CardWithPicture(
                cover: course.image,
                title: course.title,
                description: course.description,
                footer: PrimaryButton(
                    text: "Discover",
                    onPressed: () => {
                          Navigator.pushNamed(
                              context, TopicDetailPage.routeName,
                              arguments: TopicRequest(
                                  title: args.course.title,
                                  topics: args.topics,
                                  selectedIndex: 0))
                        })),
            DetailSection(courseDetail: args),
          ],
        ));
  }
}
