import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/course/topic_entity.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/custom_dropdown_button.dart';

// ignore: must_be_immutable
class TopicDropdown extends StatelessWidget {
  TopicDropdown(
      {super.key,
      required this.topicList,
      this.selectedIndex = 0,
      required this.callback});
  final List<TopicEntity> topicList;
  int selectedIndex;
  final void Function(int?) callback;

  @override
  Widget build(BuildContext context) {
    if (selectedIndex < 0 || selectedIndex >= topicList.length) {
      selectedIndex = 0;
    }

    var indexedTopicList =
        topicList.mapIndexed((index, e) => "${index + 1}. ${e.name}").toList();

    log(indexedTopicList[selectedIndex]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Topic",
            style: CommonTextStyle.bodyItalicBlack,
          ),
        ),
        CustomDropdownButton(
            items: indexedTopicList,
            hintText: "Select a topic",
            selectedValue: indexedTopicList[selectedIndex],
            keepState: true,
            callback: (String? value) =>
                {if (value != null) callback(indexedTopicList.indexOf(value))}),
      ],
    );
  }
}
