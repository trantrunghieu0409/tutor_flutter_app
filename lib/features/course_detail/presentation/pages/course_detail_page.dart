import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/card_with_picture.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/core/common_widgets/primary_button.dart';
import 'package:tutor_flutter_app/features/course_detail/data/datasources/course_detail_data.dart';
import 'package:tutor_flutter_app/features/course_detail/presentation/widgets/detail_section.dart';

class CourseInfoPage extends StatelessWidget {
  const CourseInfoPage({super.key});
  static const routeName = '/course-detail';

  @override
  Widget build(BuildContext context) {
    var newCourse = courseDetail.course;

    return Scaffold(
        appBar: const CommonAppBar(),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            CardWithPicture(
                cover: newCourse.image,
                title: newCourse.title,
                description: newCourse.description,
                footer: PrimaryButton(text: "Discover", onPressed: () => {})),
            DetailSection(
              reason: courseDetail.reason,
              purpose: courseDetail.purpose,
              level: newCourse.level,
              topics: courseDetail.topics,
              suggestedTutors: courseDetail.suggestedTutors,
            ),
          ],
        ));
  }
}
