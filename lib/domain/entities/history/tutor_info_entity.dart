import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';

class TutorInfoEntity {
  TutorInfoEntity({
    required this.id,
    required this.level,
    required this.email,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.timezone,
    required this.isPhoneAuthActivated,
    required this.canSendMessage,
    required this.isPublicRecord,
    this.studentRequest
  });
  late final String id;
  late final String level;
  late final String email;
  late final String avatar;
  late final String name;
  late final String country;
  late final String phone;
  late final String birthday;
  late final bool requestPassword;
  late final bool isActivated;
  late final int timezone;
  late final bool isPhoneAuthActivated;
  late final bool canSendMessage;
  late final bool isPublicRecord;
  final String? studentRequest;


  Image getAvatar() {
    return Image.network(avatar,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(ImageUtils.defaultImagePath);
            },);
  }
}
