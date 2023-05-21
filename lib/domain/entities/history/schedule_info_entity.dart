import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';

class ScheduleInfoEntity {
  ScheduleInfoEntity({
    required this.date,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.tutorInfo,
  });
  late final String date;
  late final int startTimestamp;
  late final int endTimestamp;
  late final String id;
  late final String tutorId;
  late final TutorInfoEntity tutorInfo;
}
