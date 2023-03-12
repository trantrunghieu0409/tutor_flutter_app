import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tutor_flutter_app/features/login/presentation/widgets/primary_button.dart';
import 'package:tutor_flutter_app/features/tutot_detail/data/models/booking_time.dart';

class BookingCalendar extends StatefulWidget {
  const BookingCalendar({super.key});

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List<BookingTime> bookingTimes = List<BookingTime>.generate(
    12,
    (index) => BookingTime(
        time: BookingTime(time: const TimeOfDay(hour: 8, minute: 30))
            .add(Duration(minutes: 60 * index)),
        isBooked: index % 4 == 0),
  );

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              bookingTimes.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!bookingTimes[index].isBooked) {
                          bookingTimes[index].isSelected =
                              !bookingTimes[index].isSelected;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: bookingTimes[index].getColor()),
                      child: Text(
                        _formatTimeOfDate(bookingTimes[index].time),
                      ),
                    ),
                  )),
        ),
        const SizedBox(
          height: 16,
        ),
        PrimaryButton(text: "Book", onPressed: () {}),
      ],
    );
  }

  String _formatTimeOfDate(TimeOfDay pickedTime) {
    return '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
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
