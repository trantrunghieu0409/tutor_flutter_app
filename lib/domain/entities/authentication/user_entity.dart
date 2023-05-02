// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:tutor_flutter_app/core/utils/image_utils.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/learn_topic_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/second_tutor_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/wallet_info_entity.dart';

class UserEntity {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String? country;
  final String phone;
  final List<String> roles;
  final String? language;
  final String? birthday;
  final bool isActivated;
  final WalletInfoEntity walletInfo;
  final List<dynamic> courses;
  final String? requireNote;
  final String? level;
  final List<LearnTopicEntity> learnTopics;
  final List<dynamic> testPreparations;
  final bool isPhoneActivated;
  final int? timezone;
  final String? studySchedule;
  final bool canSendMessage;
  final SecondTutorInfoEntity? tutorInfo;
  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    this.country,
    required this.phone,
    required this.roles,
    this.language,
    this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    this.requireNote,
    this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    required this.canSendMessage,
    this.tutorInfo,
  });

  Image getAvatar() {
    return Image.network(
      avatar,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(ImageUtils.defaultImagePath);
      },
    );
  }

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    WalletInfoEntity? walletInfo,
    List<dynamic>? courses,
    String? requireNote,
    String? level,
    List<LearnTopicEntity>? learnTopics,
    List<dynamic>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    String? studySchedule,
    bool? canSendMessage,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      walletInfo: walletInfo ?? this.walletInfo,
      courses: courses ?? this.courses,
      requireNote: requireNote ?? this.requireNote,
      level: level ?? this.level,
      learnTopics: learnTopics ?? this.learnTopics,
      testPreparations: testPreparations ?? this.testPreparations,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, avatar: $avatar, country: $country, phone: $phone, roles: $roles, language: $language, birthday: $birthday, isActivated: $isActivated, walletInfo: $walletInfo, courses: $courses, requireNote: $requireNote, level: $level, learnTopics: $learnTopics, testPreparations: $testPreparations, isPhoneActivated: $isPhoneActivated, timezone: $timezone, studySchedule: $studySchedule, canSendMessage: $canSendMessage)';
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.avatar == avatar &&
        other.country == country &&
        other.phone == phone &&
        other.roles == roles &&
        other.language == language &&
        other.birthday == birthday &&
        other.isActivated == isActivated &&
        other.walletInfo == walletInfo &&
        other.courses == courses &&
        other.requireNote == requireNote &&
        other.level == level &&
        other.learnTopics == learnTopics &&
        other.testPreparations == testPreparations &&
        other.isPhoneActivated == isPhoneActivated &&
        other.timezone == timezone &&
        other.studySchedule == studySchedule &&
        other.canSendMessage == canSendMessage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        avatar.hashCode ^
        country.hashCode ^
        phone.hashCode ^
        roles.hashCode ^
        language.hashCode ^
        birthday.hashCode ^
        isActivated.hashCode ^
        walletInfo.hashCode ^
        courses.hashCode ^
        requireNote.hashCode ^
        level.hashCode ^
        learnTopics.hashCode ^
        testPreparations.hashCode ^
        isPhoneActivated.hashCode ^
        timezone.hashCode ^
        studySchedule.hashCode ^
        canSendMessage.hashCode;
  }
}
