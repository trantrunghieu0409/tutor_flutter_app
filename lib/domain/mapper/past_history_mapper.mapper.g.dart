// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_history_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PastHistoryMapperImpl extends PastHistoryMapper {
  PastHistoryMapperImpl() : super();

  @override
  PastHistoryEntity fromModel(Rows model) {
    final pasthistoryentity = PastHistoryEntity(
      id: model.id,
      studentId: model.studentId,
      tutorId: model.tutorId,
      videoUrl: model.videoUrl,
      startTime: model.startTime,
      endTime: model.endTime,
      isReviewed: model.isReviewed,
      isTutorReviewed: model.isTutorReviewed,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      note: model.note,
      tutorInfo: fromTutorInfo(model.tutorInfo),
      during: model.during,
    );
    return pasthistoryentity;
  }

  @override
  TutorInfoEntity fromTutorInfo(TutorInfo tutorInfo) {
    final tutorinfoentity = TutorInfoEntity(
      id: tutorInfo.id,
      level: tutorInfo.level,
      email: tutorInfo.email,
      avatar: tutorInfo.avatar,
      name: tutorInfo.name,
      country: tutorInfo.country,
      phone: tutorInfo.phone,
      birthday: tutorInfo.birthday,
      requestPassword: tutorInfo.requestPassword,
      isActivated: tutorInfo.isActivated,
      timezone: tutorInfo.timezone,
      isPhoneAuthActivated: tutorInfo.isPhoneAuthActivated,
      canSendMessage: tutorInfo.canSendMessage,
      isPublicRecord: tutorInfo.isPublicRecord,
    );
    return tutorinfoentity;
  }

  @override
  FeedbackEntity fromFeedback(Feedbacks feedbacks) {
    final feedbackentity = FeedbackEntity(
      id: feedbacks.id,
      bookingId: feedbacks.bookingId,
      firstId: feedbacks.firstId,
      secondId: feedbacks.secondId,
      rating: feedbacks.rating,
      content: feedbacks.content,
      createdAt: feedbacks.createdAt,
      updatedAt: feedbacks.updatedAt,
    );
    return feedbackentity;
  }

  @override
  InfoEntity fromSecondInfo(SecondInfo secondInfo) {
    final infoentity = InfoEntity(
      level: secondInfo.level,
      email: secondInfo.email,
      google: secondInfo.google,
      facebook: secondInfo.facebook,
      apple: secondInfo.apple,
      avatar: secondInfo.avatar,
      name: secondInfo.name,
      country: secondInfo.country,
      phone: secondInfo.phone,
      language: secondInfo.language,
      birthday: secondInfo.birthday,
      requestPassword: secondInfo.requestPassword,
      isActivated: secondInfo.isActivated,
      isPhoneActivated: secondInfo.isPhoneActivated,
      requireNote: secondInfo.requireNote,
      timezone: secondInfo.timezone,
      phoneAuth: secondInfo.phoneAuth,
      isPhoneAuthActivated: secondInfo.isPhoneAuthActivated,
      studySchedule: secondInfo.studySchedule,
      canSendMessage: secondInfo.canSendMessage,
      isPublicRecord: secondInfo.isPublicRecord,
      caredByStaffId: secondInfo.caredByStaffId,
      createdAt: secondInfo.createdAt,
      updatedAt: secondInfo.updatedAt,
      deletedAt: secondInfo.deletedAt,
      studentGroupId: secondInfo.studentGroupId,
    );
    return infoentity;
  }
}
