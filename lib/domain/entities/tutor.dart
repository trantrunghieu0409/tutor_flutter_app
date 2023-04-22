import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';
import 'package:tutor_flutter_app/domain/entities/session.dart';

class Tutor {
  Tutor(
      {required this.name,
      required this.avatar,
      required this.nation,
      required this.stars,
      required this.categories,
      required this.description,
      this.isFavorite = false,
      this.videoLink,
      this.sessions = const []});

  String name;
  String avatar;
  Nation nation;
  int stars;
  List<String> categories;
  String description;
  bool isFavorite;
  String? videoLink;
  List<Session> sessions;

  getAvatar() {
    return Image.network(avatar);
  }

  removeSession(index) {
    if (index >= 0 && index < sessions.length) {
      sessions.removeAt(index);
    }
  }
}
