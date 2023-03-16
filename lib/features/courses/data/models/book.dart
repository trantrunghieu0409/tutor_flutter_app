import 'package:flutter/material.dart';

class Book {
  final Image image;
  final String title;
  final String description;
  final String level;

  Book(
      {required this.image,
      required this.title,
      required this.description,
      required this.level});
}
