import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/previous_appbar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/topic_detail/data/models/topic_request.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/widgets/pdf_holder.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/widgets/topic_dropdown.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key});
  static const routeName = '/topic-detail';

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  int? selectedTopicIndex;

  Widget? pdfHolder;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TopicRequest;
    selectedTopicIndex = selectedTopicIndex ?? args.selectedIndex;
    var topicList = args.topics;

    pdfHolder = PdfHolder(
        key: UniqueKey(),
        topicList: topicList,
        selectedTopicIndex: selectedTopicIndex);

    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
        appBar: PreviousAppBar(callback: onClosePage),
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
                      args.title,
                      style: CommonTextStyle.h2Black,
                    ),
                    TopicDropdown(
                        topicList: topicList,
                        selectedIndex: selectedTopicIndex!,
                        callback: (int? index) {
                          setState(() {
                            selectedTopicIndex = index!;
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
