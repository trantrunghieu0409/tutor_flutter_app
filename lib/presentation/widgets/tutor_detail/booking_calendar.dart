import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/schedule_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/schedule_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/primary_button.dart';

class BookingCalendar extends ConsumerStatefulWidget {
  const BookingCalendar({super.key, required this.tutorId});

  final String tutorId;

  @override
  ConsumerState<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends ConsumerState<BookingCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  String? bookingId;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _onDaySelected(_selectedDay!, _focusedDay);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      var startDay = selectedDay.subtract(const Duration(hours: 7));
      var endDay =
          startDay.add(const Duration(hours: 23, minutes: 59, seconds: 59));
      log('start + end');

      ref.read(schedulesProvider.notifier).getScheduleByTutorId(
          widget.tutorId,
          (startDay.toUtc().microsecondsSinceEpoch / 1000).round(),
          (endDay.toUtc().microsecondsSinceEpoch / 1000).round());
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
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
                          if (bookingId == schedules[index].id) {
                            bookingId = null;
                          } else {
                            bookingId = schedules[index].id;
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
                                  bookingId == schedules[index].id,
                              isBooked: schedules[index].isBooked,
                              time: schedules[index].startTimestamp)),
                      child: Text(
                        "${_formatScheduleTime(schedules[index].startTimestamp)} - ${_formatScheduleTime(schedules[index].endTimestamp)}",
                        style: CommonTextStyle.body,
                      ),
                    ),
                  )),
        ),
        const SizedBox(
          height: 16,
        ),
        PrimaryButton(
            text: "Book",
            onPressed: () {
              if (bookingId != null) {
                ref.read(schedulesProvider.notifier).book(bookingId!);
              }
            }),
      ],
    );
  }

  String _formatTimeOfDate(TimeOfDay pickedTime) {
    return '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatScheduleTime(int time) {
    return _formatTimeOfDate(TimeOfDay.fromDateTime(
        DateTime.fromMicrosecondsSinceEpoch(time * 1000, isUtc: true)
            .toLocal()));
  }

  bool _isPast(int time) {
    var day = DateTime.fromMicrosecondsSinceEpoch(time * 1000, isUtc: true);
    log(day.toString());
    log(DateTime.now().toUtc().toString());
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
          children: const [
            Icon(
              Icons.circle,
              color: Colors.green,
            ),
            Text("Available"),
          ],
        ),
        Wrap(
          spacing: 4,
          children: const [
            Icon(
              Icons.circle,
              color: Colors.amber,
            ),
            Text("Seleted"),
          ],
        ),
        Wrap(
          spacing: 4,
          children: const [
            Icon(
              Icons.circle,
              color: Colors.red,
            ),
            Text("Booked"),
          ],
        ),
      ],
    );
  }
}
