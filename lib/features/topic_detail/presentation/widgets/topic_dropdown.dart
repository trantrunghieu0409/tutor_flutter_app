import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/custom_dropdown_button.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';

class TopicDropdown extends StatelessWidget {
  TopicDropdown(
      {super.key,
      required this.topicList,
      this.selectedIndex = 0,
      required this.callback});
  final List<Topic> topicList;
  int selectedIndex;
  void Function(int?) callback;

  @override
  Widget build(BuildContext context) {
    if (selectedIndex < 0 || selectedIndex >= topicList.length) {
      selectedIndex = 0;
    }

    var indexedTopicList =
        topicList.mapIndexed((index, e) => "${index + 1}. ${e.name}").toList();

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
            callback: (String? value) =>
                {if (value != null) callback(indexedTopicList.indexOf(value))}),
      ],
    );
  }
}
