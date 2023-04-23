// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class TutorMapperImpl extends TutorMapper {
  TutorMapperImpl() : super();

  @override
  TutorEntity fromModel(Rows model) {
    final tutorentity = TutorEntity(
      level: model.level,
      email: model.email,
      google: model.google,
      facebook: model.facebook,
      apple: model.apple,
      avatar: model.avatar,
      name: model.name,
      country: model.country,
      phone: model.phone,
      language: model.language,
      birthday: model.birthday,
      requestPassword: model.requestPassword,
      isActivated: model.isActivated,
      isPhoneActivated: model.isPhoneActivated,
      requireNote: model.requireNote,
      timezone: model.timezone,
      phoneAuth: model.phoneAuth,
      isPhoneAuthActivated: model.isPhoneAuthActivated,
      studySchedule: model.studySchedule,
      canSendMessage: model.canSendMessage,
      isPublicRecord: model.isPublicRecord,
      caredByStaffId: model.caredByStaffId,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      deletedAt: model.deletedAt,
      studentGroupId: model.studentGroupId,
      feedbacks: model.feedbacks?.map((e) => e).toList(),
      id: model.id,
      userId: model.userId,
      video: model.video,
      bio: model.bio,
      education: model.education,
      experience: model.experience,
      profession: model.profession,
      accent: model.accent,
      targetStudent: model.targetStudent,
      interests: model.interests,
      languages: model.languages,
      specialties: model.specialties,
      resume: model.resume,
      rating: model.rating,
      isNative: model.isNative,
      price: model.price,
      isOnline: model.isOnline,
    );
    return tutorentity;
  }
}
