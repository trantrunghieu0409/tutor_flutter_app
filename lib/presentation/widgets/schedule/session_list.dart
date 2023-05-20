import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';

class SessionList extends StatefulWidget {
  const SessionList(
      {super.key, required this.tutor});

  final TutorHistoryEntity tutor;
 
  @override
  State<SessionList> createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  @override
  Widget build(BuildContext context) {
    var sessions = widget.tutor.scheduleHitories;

    return Column(children: [
      BorderContainer(
          child: sessions.isEmpty
              ? const Text(
                  "No session yet!",
                  style: CommonTextStyle.bodyItalicBlack,
                )
              : Text(
                  "Lesson Time: ${DateTimeUtils.formatTimeRange(sessions.first.startTimestamp, sessions.last.endTimestamp)}",
                  style: CommonTextStyle.h3Black,
                )),
      const SizedBox(
        height: 16,
      ),
      BorderContainer(
          child: Column(
        children: List<Widget>.generate(
            sessions.length,
            (index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Session ${(index + 1)}: ${DateTimeUtils.formatTimeRange(sessions[index].startTimestamp, sessions[index].endTimestamp)}',
                          style: CommonTextStyle.bodyBlack,
                        ),
                        IconButton(
                            onPressed: () => setState(() {
                                  if (index >= 0 && index < sessions.length) {
                                    sessions.removeAt(index);
                                  }
                                }),
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                )),
      ))
    ]);
  }
}
