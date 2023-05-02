import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';

class PdfHolder extends StatefulWidget {
  const PdfHolder(
      {super.key,
      required this.topicList,
      this.selectedTopicIndex,
      this.isSwipeHorizontal = true});
  final List<TopicEntity> topicList;
  final int? selectedTopicIndex;
  final bool isSwipeHorizontal;

  @override
  State<PdfHolder> createState() => _PdfHolderState();
}

class _PdfHolderState extends State<PdfHolder> {
  late int selectedIndex;
  late List<TopicEntity> topicList;

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
      swipeHorizontal: widget.isSwipeHorizontal,
      autoSpacing: true,
      pageFling: true,
      onError: (error) {
        log(error.toString());
      },
      onPageError: (page, error) {
        log('$page: ${error.toString()}');
      },
      onPageChanged: (int? page, int? total) {
        log('page change: $page/$total');
      },
    ).cachedFromUrl(
      topicList[selectedIndex].nameFile,
      placeholder: (progress) => Center(child: Text('$progress %')),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
