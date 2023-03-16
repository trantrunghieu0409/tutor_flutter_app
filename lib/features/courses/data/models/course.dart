import 'package:flutter/material.dart';

class Course {
  final Image image;
  final String title;
  final String description;
  final String level;
  final int nLessons;

  Course(
      {required this.image,
      required this.title,
      required this.description,
      required this.level,
      required this.nLessons});
}
