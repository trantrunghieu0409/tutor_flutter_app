import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';
import 'package:tutor_flutter_app/domain/entities/topic_request.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/previous_appbar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/topic_detail/pdf_holder.dart';
import 'package:tutor_flutter_app/presentation/widgets/topic_detail/topic_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key});
  static const routeName = '/topic-detail';

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  int? selectedTopicIndex;

  Widget? pdfHolder;

  late List<TopicEntity> topics;

  late String courseName;

  @override
  void initState() {
    super.initState();
  }

  bool isHorizontal = true;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TopicRequest;
    selectedTopicIndex = selectedTopicIndex ?? args.selectedIndex;
    topics = args.topics.cast<TopicEntity>();
    courseName = args.title;
    pdfHolder = PdfHolder(
      key: UniqueKey(),
      topicList: topics,
      selectedTopicIndex: selectedTopicIndex,
      isSwipeHorizontal: isHorizontal,
    );

    onClosePage() => {Navigator.pop(context)};

    return Scaffold(
        appBar: PreviousAppBar(callback: onClosePage),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              isHorizontal = !isHorizontal;
            });
          },
          backgroundColor: Colors.lightBlue,
          label: Text(isHorizontal
              ? AppLocalizations.of(context)!.horizontal_swipe
              : AppLocalizations.of(context)!.vertical_swipe),
          icon:
              Icon(isHorizontal ? Icons.compare_arrows : Icons.arrow_downward),
        ),
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
                      courseName,
                      style: CommonTextStyle.h2Second,
                    ),
                    TopicDropdown(
                        topicList: topics,
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
