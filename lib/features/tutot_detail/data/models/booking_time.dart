import 'package:flutter/material.dart';

class BookingTime {
  BookingTime(
      {required this.time, this.isBooked = false, this.isSelected = false});

  TimeOfDay time;
  bool isBooked;
  bool isSelected;

  Color getColor() {
    if (isBooked) return Colors.red;
    return isSelected ? Colors.amber : Colors.green;
  }

  TimeOfDay add(Duration duration) {
    DateTime today = DateTime.now();
    DateTime customDateTime =
        DateTime(today.year, today.month, today.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(customDateTime.add(duration));
  }
}
