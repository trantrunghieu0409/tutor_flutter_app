import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/common/specility_enum.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';

class TutorEntity {
  TutorEntity(
      {this.level,
      required this.email,
      required this.avatar,
      required this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      required this.requestPassword,
      required this.isActivated,
      this.timezone,
      required this.id,
      this.userId = "",
      this.video = "",
      this.bio = "",
      this.education = "",
      this.experience = "",
      this.profession = "",
      this.accent,
      this.targetStudent = "",
      this.interests = "",
      this.specialties = "",
      this.resume,
      this.rating,
      this.price = 0,
      this.isOnline = false,
      required this.feedbacks});
  late final String? level;
  late final String email;
  late final String? avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final int? timezone;
  late final String id;
  late final String userId;
  late final String video;
  late final String bio;
  late final String education;
  late final String experience;
  late final String profession;
  late final String? accent;
  late final String targetStudent;
  late final String interests;
  late final String languages;
  late final String specialties;
  late final String? resume;
  late final double? rating;
  late final int? price;
  late final bool? isOnline;
  late List<FeedbackEntity> feedbacks;
  bool isFavorite = false;

  Image getAvatar() {
    return avatar != null && avatar != 'https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png'
        ? Image.network(
            avatar!,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(ImageUtils.defaultImagePath);
            },
          )
        : Image.asset(ImageUtils.defaultImagePath);
  }

  int get stars => rating != null ? rating!.round() : 0;

  List<String> get specialtyList =>
      specialties.split(',').map((e) => SpecialityEnum.getValue(e)).toList();

  String getCountry() => country ?? "Unknown";

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
