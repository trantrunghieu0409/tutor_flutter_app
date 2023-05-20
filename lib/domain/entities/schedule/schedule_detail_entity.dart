class ScheduleDetailEntity {
  ScheduleDetailEntity({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.isBooked,
  });
  late final int startPeriodTimestamp;
  late final int endPeriodTimestamp;
  late final String id;
  late final String scheduleId;
  late final String startPeriod;
  late final String endPeriod;
  late final String createdAt;
  late final String updatedAt;
  late final bool isBooked;
}
