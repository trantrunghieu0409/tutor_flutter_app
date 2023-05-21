import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';

class InfoEntity {
  InfoEntity({
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    required this.avatar,
    required this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });
  late final String? level;
  late final String? email;
  late final String? google;
  late final String? facebook;
  late final String? apple;
  late final String avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool? requestPassword;
  late final bool? isActivated;
  late final bool? isPhoneActivated;
  late final String? requireNote;
  late final int? timezone;
  late final String? phoneAuth;
  late final bool? isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool? canSendMessage;
  late final bool? isPublicRecord;
  late final String? caredByStaffId;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;
  late final String? studentGroupId;

  Image getAvatar() {
    return Image.network(
      avatar,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(ImageUtils.defaultImagePath);
      },
    );
  }

  String getCountry() => country ?? "Unknown";
}
