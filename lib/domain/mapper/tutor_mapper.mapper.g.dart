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
      avatar: model.avatar,
      name: model.name,
      country: model.country,
      phone: model.phone,
      language: model.language,
      birthday: model.birthday,
      requestPassword: model.requestPassword,
      isActivated: model.isActivated,
      timezone: model.timezone,
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
      price: model.price,
      isOnline: model.isOnline,
      feedbacks: model.feedbacks.map((x) => fromFeedback(x)).toList(),
    );
    return tutorentity;
  }

  @override
  FeedbackEntity fromFeedback(Feedbacks feedback) {
    final feedbackentity = FeedbackEntity(
      id: feedback.id,
      bookingId: feedback.bookingId,
      firstId: feedback.firstId,
      secondId: feedback.secondId,
      rating: feedback.rating,
      content: feedback.content,
      createdAt: feedback.createdAt,
      updatedAt: feedback.updatedAt,
      firstInfo: fromFirstInfo(feedback.firstInfo),
    );
    return feedbackentity;
  }

  @override
  FirstInfoEntity fromFirstInfo(FirstInfo firstInfo) {
    final firstinfoentity = FirstInfoEntity(
      level: firstInfo.level,
      email: firstInfo.email,
      google: firstInfo.google,
      facebook: firstInfo.facebook,
      apple: firstInfo.apple,
      avatar: firstInfo.avatar,
      name: firstInfo.name,
      country: firstInfo.country,
      phone: firstInfo.phone,
      language: firstInfo.language,
      birthday: firstInfo.birthday,
      requestPassword: firstInfo.requestPassword,
      isActivated: firstInfo.isActivated,
      isPhoneActivated: firstInfo.isPhoneActivated,
      requireNote: firstInfo.requireNote,
      timezone: firstInfo.timezone,
      phoneAuth: firstInfo.phoneAuth,
      isPhoneAuthActivated: firstInfo.isPhoneAuthActivated,
      studySchedule: firstInfo.studySchedule,
      canSendMessage: firstInfo.canSendMessage,
      isPublicRecord: firstInfo.isPublicRecord,
      caredByStaffId: firstInfo.caredByStaffId,
      createdAt: firstInfo.createdAt,
      updatedAt: firstInfo.updatedAt,
      deletedAt: firstInfo.deletedAt,
      studentGroupId: firstInfo.studentGroupId,
    );
    return firstinfoentity;
  }
}
