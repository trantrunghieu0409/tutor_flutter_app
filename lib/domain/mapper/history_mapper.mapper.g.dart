// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class HistoryMapperImpl extends HistoryMapper {
  HistoryMapperImpl() : super();

  @override
  HistoryEntity fromModel(Rows model) {
    final historyentity = HistoryEntity(
      createdAtTimeStamp: model.createdAtTimeStamp,
      updatedAtTimeStamp: model.updatedAtTimeStamp,
      id: model.id,
      userId: model.userId,
      scheduleDetailId: model.scheduleDetailId,
      tutorMeetingLink: model.tutorMeetingLink,
      studentMeetingLink: model.studentMeetingLink,
      studentRequest: model.studentRequest,
      tutorReview: model.tutorReview,
      scoreByTutor: model.scoreByTutor,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      recordUrl: model.recordUrl,
      cancelReasonId: model.cancelReasonId,
      lessonPlanId: model.lessonPlanId,
      cancelNote: model.cancelNote,
      calendarId: model.calendarId,
      isDeleted: model.isDeleted,
      scheduleDetailInfo: fromScheduleDetailInfo(model.scheduleDetailInfo),
      classReview: model.classReview,
      feedbacks: model.feedbacks.map((e) => e).toList(),
    );
    return historyentity;
  }

  @override
  ScheduleDetailInfoEntity fromScheduleDetailInfo(
      ScheduleDetailInfo scheduleDetailInfo) {
    final scheduledetailinfoentity = ScheduleDetailInfoEntity(
      startPeriodTimestamp: scheduleDetailInfo.startPeriodTimestamp,
      endPeriodTimestamp: scheduleDetailInfo.endPeriodTimestamp,
      id: scheduleDetailInfo.id,
      scheduleId: scheduleDetailInfo.scheduleId,
      startPeriod: scheduleDetailInfo.startPeriod,
      endPeriod: scheduleDetailInfo.endPeriod,
      createdAt: scheduleDetailInfo.createdAt,
      updatedAt: scheduleDetailInfo.updatedAt,
      scheduleInfo: fromScheduleInfo(scheduleDetailInfo.scheduleInfo),
    );
    return scheduledetailinfoentity;
  }

  @override
  ScheduleInfoEntity fromScheduleInfo(ScheduleInfo scheduleInfo) {
    final scheduleinfoentity = ScheduleInfoEntity(
      date: scheduleInfo.date,
      startTimestamp: scheduleInfo.startTimestamp,
      endTimestamp: scheduleInfo.endTimestamp,
      id: scheduleInfo.id,
      tutorId: scheduleInfo.tutorId,
      tutorInfo: fromTutorInfo(scheduleInfo.tutorInfo),
    );
    return scheduleinfoentity;
  }

  @override
  TutorInfoEntity fromTutorInfo(TutorInfo data) {
    final tutorinfoentity = TutorInfoEntity(
      id: data.id,
      level: data.level,
      email: data.email,
      avatar: data.avatar,
      name: data.name,
      country: data.country,
      phone: data.phone,
      birthday: data.birthday,
      requestPassword: data.requestPassword,
      isActivated: data.isActivated,
      timezone: data.timezone,
      isPhoneAuthActivated: data.isPhoneAuthActivated,
      canSendMessage: data.canSendMessage,
      isPublicRecord: data.isPublicRecord,
    );
    return tutorinfoentity;
  }
}
