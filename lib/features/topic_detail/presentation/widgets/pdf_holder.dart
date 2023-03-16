import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';

class PdfHolder extends StatefulWidget {
  PdfHolder({super.key, required this.topicList, this.selectedTopicIndex});
  final List<Topic> topicList;
  int? selectedTopicIndex;

  @override
  State<PdfHolder> createState() => _PdfHolderState();
}

class _PdfHolderState extends State<PdfHolder> {
  late int selectedIndex;
  late List<Topic> topicList;

  @override
  void initState() {
    topicList = widget.topicList;
    selectedIndex = widget.selectedTopicIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PDF(
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: true,
      pageFling: true,
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      onPageChanged: (int? page, int? total) {
        print('page change: $page/$total');
      },
    ).cachedFromUrl(
      topicList[selectedIndex].pdfUrl,
      placeholder: (progress) => Center(child: Text('$progress %')),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
