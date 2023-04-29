import 'package:flutter/material.dart';

class FirstInfoEntity {
  FirstInfoEntity({
    this.level,
    required this.email,
    this.google,
    this.facebook,
    this.apple,
    required this.avatar,
    required this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    required this.requestPassword,
    required this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    required this.timezone,
    this.phoneAuth,
    required this.isPhoneAuthActivated,
    this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    this.caredByStaffId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });
  late final String? level;
  late final String email;
  late final String? google;
  late final String? facebook;
  late final String? apple;
  late final String avatar;
  late final String name;
  late final String? country;
  late final String? phone;
  late final String? language;
  late final String? birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final bool? isPhoneActivated;
  late final String? requireNote;
  late final int timezone;
  late final String? phoneAuth;
  late final bool isPhoneAuthActivated;
  late final String? studySchedule;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  late final String? caredByStaffId;
  late final String createdAt;
  late final String updatedAt;
  late final String? deletedAt;
  late final String? studentGroupId;

  Image getAvatar() {
    return Image.network(avatar);
  }

  String getCountry() => country ?? "Unknown";
}
