import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';
import 'package:tutor_flutter_app/domain/entities/session.dart';

class TutorEntity {
  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  String? phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? studentGroupId;
  List<Feedbacks>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;
  bool? isNative;
  int? price;
  bool? isOnline;

  TutorEntity(
      {this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
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
      this.feedbacks,
      this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.resume,
      this.rating,
      this.isNative,
      this.price,
      this.isOnline});

  // todo: remove
  late List<Session> sessions;
  bool isFavorite = false;

  getAvatar() {
    return Image.network(avatar!);
  }

  removeSession(index) {
    if (index >= 0 && index < sessions.length) {
      sessions.removeAt(index);
    }
  }

  int get stars => rating == null ? 0 : rating!.round();

  List<String> get specialtyList => specialties!.split(',');
}
