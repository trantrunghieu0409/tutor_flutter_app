import 'package:tutor_flutter_app/domain/entities/history/schedule_detail_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';

class HistoryEntity {
  HistoryEntity({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    required this.tutorMeetingLink,
    required this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    required this.createdAt,
    required this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    required this.isDeleted,
    required this.scheduleDetailInfo,
    this.classReview,
    required this.feedbacks,
  });
  late final int createdAtTimeStamp;
  late final int updatedAtTimeStamp;
  late final String id;
  late final String userId;
  late final String scheduleDetailId;
  late final String tutorMeetingLink;
  late final String studentMeetingLink;
  late final String? studentRequest;
  late final void tutorReview;
  late final void scoreByTutor;
  late final String createdAt;
  late final String updatedAt;
  late final void recordUrl;
  late final void cancelReasonId;
  late final void lessonPlanId;
  late final void cancelNote;
  late final void calendarId;
  late final bool isDeleted;
  late final ScheduleDetailInfoEntity scheduleDetailInfo;
  late final void classReview;
  late final List<dynamic> feedbacks;

  String get tutorId => scheduleDetailInfo.scheduleInfo.tutorId;

  TutorInfoEntity get tutorInfo => scheduleDetailInfo.scheduleInfo.tutorInfo;

  DateTime get date => DateTime.parse(scheduleDetailInfo.scheduleInfo.date);
}
