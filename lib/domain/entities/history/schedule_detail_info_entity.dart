import 'package:tutor_flutter_app/domain/entities/history/schedule_info_entity.dart';

class ScheduleDetailInfoEntity {
  ScheduleDetailInfoEntity({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduleInfo,
  });
  late final int startPeriodTimestamp;
  late final int endPeriodTimestamp;
  late final String id;
  late final String scheduleId;
  late final String startPeriod;
  late final String endPeriod;
  late final String createdAt;
  late final String updatedAt;
  late final ScheduleInfoEntity scheduleInfo;
}