import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';

class PastHistoryEntity {
  PastHistoryEntity(
      {required this.id,
      required this.studentId,
      required this.tutorId,
      this.videoUrl,
      required this.startTime,
      required this.endTime,
      required this.isReviewed,
      required this.isTutorReviewed,
      required this.createdAt,
      required this.updatedAt,
      this.note,
      required this.tutorInfo,
      required this.during,
      this.feedbacks});
  late final String id;
  late final String studentId;
  late final String tutorId;
  late final String? videoUrl;
  late final String startTime;
  late final String endTime;
  late final bool isReviewed;
  late final bool isTutorReviewed;
  late final String createdAt;
  late final String updatedAt;
  late final String? note;
  late final TutorInfoEntity tutorInfo;
  late final String during;

  late final List<FeedbackEntity>? feedbacks;
}
