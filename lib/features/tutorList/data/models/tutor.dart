import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';

class Tutor {
  Tutor(this.name, this.avatar, this.nation, this.stars, this.categories,
      this.description, this.isFavorite);

  String name;
  String avatar;
  Nation nation;
  int stars;
  List<String> categories;
  String description;
  bool isFavorite;

  getAvatar() {
    return Image.network(avatar);
  }
}
