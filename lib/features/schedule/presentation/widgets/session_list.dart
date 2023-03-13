import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/common_widgets/border_container.dart';
import 'package:tutor_flutter_app/core/common_widgets/border_outline_button.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';

class SessionList extends StatefulWidget {
  SessionList({super.key, required this.tutor});
  Tutor tutor;

  @override
  State<SessionList> createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  @override
  Widget build(BuildContext context) {
    var sessions = widget.tutor.sessions;
    var fromLessonTime = sessions.isEmpty
        ? null
        : DateTimeUtils.formatTimeOfDay(sessions[0].from);
    var toLessonTime = sessions.isEmpty
        ? null
        : DateTimeUtils.formatTimeOfDay(sessions.last.to);

    return Column(children: [
      BorderContainer(
          child: sessions.isEmpty
              ? const Text(
                  "No session yet!",
                  style: CommonTextStyle.bodyItalicBlack,
                )
              : Text(
                  "Lesson Time: $fromLessonTime - $toLessonTime",
                  style: CommonTextStyle.h3Black,
                )),
      const SizedBox(
        height: 16,
      ),
      ...List<Widget>.generate(
          sessions.length,
          (index) => BorderContainer(
                  child: Column(
                children: [
                  Text(
                    'Session ${(index + 1)}: ${sessions[index]}',
                    style: CommonTextStyle.h3Black,
                  ),
                  BorderOutlineButton(
                    labelText: "Cancel",
                    icon: Icons.cancel,
                    onPressed: () => setState(() {
                      if (index >= 0 && index < sessions.length) {
                        sessions.removeAt(index);
                      }
                    }),
                  )
                ],
              ))),
    ]);
  }
}
