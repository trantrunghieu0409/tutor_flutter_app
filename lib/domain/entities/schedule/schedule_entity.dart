import 'package:tutor_flutter_app/domain/entities/schedule/schedule_detail_entity.dart';

class ScheduleEntity {
  ScheduleEntity({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.isBooked,
    required this.scheduleDetails,
  });
  late final String id;
  late final String tutorId;
  late final String startTime;
  late final String endTime;
  late final int startTimestamp;
  late final int endTimestamp;
  late final bool isBooked;
  late final List<ScheduleDetailEntity> scheduleDetails;
}
