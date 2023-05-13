import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/data/models/request/cancel_schedule_req.dart';
import 'package:tutor_flutter_app/domain/entities/history/schedule_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_history_entity.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/presentation/helpers/result_dialog.dart';
import 'package:tutor_flutter_app/presentation/providers/history_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/border_container.dart';

class SessionList extends ConsumerStatefulWidget {
  const SessionList({super.key, required this.tutor});

  final TutorHistoryEntity tutor;

  @override
  ConsumerState<SessionList> createState() => _SessionListState();
}

class _SessionListState extends ConsumerState<SessionList> {
  @override
  Widget build(BuildContext context) {
    var sessions = widget.tutor.scheduleHitories;

    return Column(children: [
      BorderContainer(
          child: sessions.isEmpty
              ? const Text(
                  "No session yet!",
                  style: CommonTextStyle.bodyItalicSecond,
                )
              : Text(
                  "Lesson Time: ${DateTimeUtils.formatTimeRange(sessions.first.startTimestamp, sessions.last.endTimestamp)}",
                  style: CommonTextStyle.h3Second,
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
                          style: CommonTextStyle.bodySecond,
                        ),
                        IconButton(
                            onPressed: () {
                              _showConfirmDialog(sessions[index],
                                  widget.tutor.histories[index].id);
                            },
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

  final List<String> list = <String>[
    'Reschedule at another time',
    'Busy at that time',
    'Asked by tutor',
    'Other'
  ];

  Future<void> _showConfirmDialog(
      ScheduleInfoEntity session, String scheduleDetailId) async {
    if (DateTimeUtils.getDateTime(session.startTimestamp)
            .difference(DateTime.now()) <
        const Duration(hours: 2)) {
      return DialogHelpers.showSimpleResultDialog(
        context,
        "Cannot cancel session ${DateTimeUtils.formatTimeRange(session.startTimestamp, session.endTimestamp)}'",
        'You cannot cancel the class less than 2 hours before it starts',
      );
    }
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return _buildCancelDialog(session, scheduleDetailId);
        });
  }

  _buildCancelDialog(ScheduleInfoEntity session, String scheduleDetailId) {
    String dropdownValue = list.first;
    return StatefulBuilder(builder: (context, setter) {
      return AlertDialog(
        title: Text(widget.tutor.tutorInfo.name),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Lesson time: ${DateTimeUtils.formatTimeRange(session.startTimestamp, session.endTimestamp)}',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("What is the reason you want to cancel this session?"),
              DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setter(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              if (dropdownValue == 'Other')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Your reason: "),
                    TextField(
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Later")),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              Navigator.of(context).pop();
              DialogHelpers.showFutureResultDialog(
                  successText: "Canceled this session successfully!",
                  failText: "Something went wrong",
                  context: context,
                  isSuccess: ref.watch(historyProvider.notifier).cancelSchedule(
                      CancelScheduleReq(
                          scheduleDetailId: scheduleDetailId,
                          cancelReasonId: list.indexOf(dropdownValue) + 1)),
                  onSuccess: () {
                    ref.watch(historyProvider.notifier).getHistory();
                  });
            },
          ),
        ],
      );
    });
  }
}
