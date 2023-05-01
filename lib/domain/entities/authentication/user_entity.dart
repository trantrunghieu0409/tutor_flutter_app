import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/learn_topic_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/wallet_info_entity.dart';

class UserEntity {
  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
    this.language,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    this.studySchedule,
    required this.canSendMessage,
  });
  late final String id;
  late final String email;
  late final String name;
  late final String avatar;
  late final String country;
  late final String phone;
  late final List<String> roles;
  late final String? language;
  late final String birthday;
  late final bool isActivated;
  late final WalletInfoEntity walletInfo;
  late final List<dynamic> courses;
  late final String requireNote;
  late final String level;
  late final List<LearnTopicEntity> learnTopics;
  late final List<dynamic> testPreparations;
  late final bool isPhoneActivated;
  late final int timezone;
  late final String? studySchedule;
  late final bool canSendMessage;

  Image getAvatar() {
    try {
      return Image.network(avatar);
    } catch (e) {
      return Image.asset(ImageUtils.defaultImagePath);
    }
  }
}
