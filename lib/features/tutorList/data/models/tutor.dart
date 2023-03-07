import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';

class Tutor {
  Tutor(this.name, this.avatar, this.nation, this.stars, this.description);

  String name;
  String avatar;
  Nation nation;
  int stars;
  String description;

  getAvatar() {
    return Image.network(avatar);
  }
}
