import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/common_appbar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/course_detail/data/datasources/course_detail_data.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/widgets/pdf_holder.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/widgets/topic_dropdown.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key});
  static const routeName = '/topic-detail';

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  var newCourse = courseDetail.course;
  var topicList = courseDetail.topics;
  var selectedTopicIndex = 1;

  late Widget pdfHolder;

  @override
  void initState() {
    pdfHolder =
        PdfHolder(topicList: topicList, selectedTopicIndex: selectedTopicIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newCourse.title,
                      style: CommonTextStyle.h2Black,
                    ),
                    TopicDropdown(
                        topicList: topicList,
                        selectedIndex: selectedTopicIndex,
                        callback: (int? index) {
                          setState(() {
                            pdfHolder = PdfHolder(
                                key: UniqueKey(),
                                topicList: topicList,
                                selectedTopicIndex: index);
                          });
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height - 320,
                child: pdfHolder)
          ],
        ));
  }
}
