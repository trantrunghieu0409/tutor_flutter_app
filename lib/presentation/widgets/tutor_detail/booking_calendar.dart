import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/schedule_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/schedule_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingCalendar extends ConsumerStatefulWidget {
  const BookingCalendar({super.key, required this.tutor});

  final TutorEntity tutor;

  @override
  ConsumerState<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends ConsumerState<BookingCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  ScheduleEntity? scheduleEntity;
  String? bookingId;
  String note = "";

  @override
  void initState() {
    _selectedDay = _focusedDay;
    _getScheduleListInDay(_selectedDay!);
    super.initState();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _getScheduleListInDay(selectedDay);

      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        bookingId = null;
      });
    }
  }

  void _getScheduleListInDay(DateTime selectedDay) {
    var startTime = selectedDay.subtract(const Duration(hours: 7));
    var endTime =
        startTime.add(const Duration(hours: 23, minutes: 59, seconds: 59));

    ref.read(schedulesProvider.notifier).getScheduleByTutorId(
        widget.tutor.userId,
        (startTime.toUtc().microsecondsSinceEpoch / 1000).round(),
        (endTime.toUtc().microsecondsSinceEpoch / 1000).round());
  }

  @override
  Widget build(BuildContext context) {
    List<ScheduleEntity> schedules = ref.watch(schedulesProvider);

    return Column(
      children: [
        Card(
          elevation: 8,
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildIconRows(),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List<Widget>.generate(
              schedules.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!_isPast(schedules[index].startTimestamp) &&
                            !schedules[index].isBooked) {
                          if (bookingId ==
                              schedules[index].scheduleDetails[0].id) {
                            bookingId = null;
                            scheduleEntity = null;
                          } else {
                            bookingId = schedules[index].scheduleDetails[0].id;
                            scheduleEntity = schedules[index];
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: _getColor(
                              isSelected: bookingId != null &&
                                  bookingId ==
                                      schedules[index].scheduleDetails[0].id,
                              isBooked: schedules[index].isBooked,
                              time: schedules[index].startTimestamp)),
                      child: Text(
                        "${DateTimeUtils.formatScheduleTime(schedules[index].startTimestamp)} - ${DateTimeUtils.formatScheduleTime(schedules[index].endTimestamp)}",
                        style: CommonTextStyle.body,
                      ),
                    ),
                  )),
        ),
        if (schedules.isNotEmpty)
          const SizedBox(
            height: 16,
          ),
        if (schedules.isNotEmpty)
          PrimaryButton(
              text: AppLocalizations.of(context)!.book,
              onPressed: () {
                if (bookingId != null && scheduleEntity != null) {
                  _showBookingDialog(bookingId!, scheduleEntity!.startTimestamp,
                      scheduleEntity!.endTimestamp);
                }
              }),
        if (schedules.isNotEmpty)
          const SizedBox(
            height: 64,
          ),
      ],
    );
  }

  Future<void> _showBookingDialog(
      String bookingId, int startTimestamp, int endTimestamp) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.book_detail,
            style: CommonTextStyle.h1Second,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.book_time,
                  style: CommonTextStyle.h2Second,
                ),
                Text(
                  "${DateTimeUtils.formatScheduleTime(startTimestamp)} - ${DateTimeUtils.formatScheduleTime(endTimestamp)}",
                  style: CommonTextStyle.bodySecond,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.price,
                      style: CommonTextStyle.h2Second,
                    ),
                    Text(
                      "${widget.tutor.price} ${AppLocalizations.of(context)!.lesson}",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.note,
                  style: CommonTextStyle.h2Second,
                ),
                GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.cancel)),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.book),
              onPressed: () {
                Navigator.of(context).pop();
                _showBookingResult();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showBookingResult() async {
    if (bookingId == null) return;

    Future<bool> isSuccess =
        ref.read(schedulesProvider.notifier).bookSchedule(bookingId!, note);

    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: FutureBuilder(
                future: isSuccess,
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    bool isSuccess = snapshot.data!;

                    String displayText = isSuccess
                        ? AppLocalizations.of(context)!.book_success
                        : AppLocalizations.of(context)!.book_fail;

                    if (isSuccess) {
                      _getScheduleListInDay(_selectedDay ?? DateTime.now());
                      widget.tutor.price = widget.tutor.price != null
                          ? widget.tutor.price! - 1
                          : 0;
                    }
                    return SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              snapshot.data!
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 64,
                                    )
                                  : const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 64,
                                    ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                displayText,
                                style: CommonTextStyle.bodySecond,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      heightFactor: 1.0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          );
        });
  }

  bool _isPast(int time) {
    var day = DateTime.fromMicrosecondsSinceEpoch(time * 1000, isUtc: true);
    return day.toLocal().compareTo(DateTime.now()) <= 0;
  }

  Color _getColor(
      {required bool isSelected, required bool isBooked, required int time}) {
    if (_isPast(time)) {
      return Colors.grey;
    }
    if (isBooked) {
      return Colors.red;
    }
    if (isSelected) {
      return Colors.amber;
    }
    return Colors.green;
  }

  Widget _buildIconRows() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          spacing: 4,
          children: [
            const Icon(
              Icons.circle,
              color: Colors.green,
            ),
            Text(AppLocalizations.of(context)!.available),
          ],
        ),
        Wrap(
          spacing: 4,
          children: [
            const Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            Text(AppLocalizations.of(context)!.selected),
          ],
        ),
        Wrap(
          spacing: 4,
          children: [
            const Icon(
              Icons.circle,
              color: Colors.red,
            ),
            Text(AppLocalizations.of(context)!.booked),
          ],
        ),
      ],
    );
  }
}
