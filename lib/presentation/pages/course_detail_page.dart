import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';
import 'package:tutor_flutter_app/domain/entities/topic_request.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/card_with_picture.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:tutor_flutter_app/presentation/widgets/course_detail/detail_section.dart';
import 'package:tutor_flutter_app/presentation/pages/topic_detail_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});
  static const routeName = '/course-detail';

  @override
  Widget build(BuildContext context) {
    final course = ModalRoute.of(context)!.settings.arguments as CourseEntity;
    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
        appBar: PreviousAppBar(
          callback: onClosePage,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            CardWithPicture(
                cover: ImageUtils.getImage(course.imageUrl),
                title: course.name,
                description: course.description,
                footer: PrimaryButton(
                    text: AppLocalizations.of(context)!.discover,
                    onPressed: () => {
                          Navigator.pushNamed(
                              context, TopicDetailPage.routeName,
                              arguments: TopicRequest(
                                  title: course.name,
                                  topics: course.topics,
                                  selectedIndex: 0))
                        })),
            DetailSection(course: course),
          ],
        ));
  }
}
