// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class ScheduleMapperImpl extends ScheduleMapper {
  ScheduleMapperImpl() : super();

  @override
  ScheduleEntity fromModel(ScheduleOfTutor model) {
    final scheduleentity = ScheduleEntity(
      id: model.id,
      tutorId: model.tutorId,
      startTime: model.startTime,
      endTime: model.endTime,
      startTimestamp: model.startTimestamp,
      endTimestamp: model.endTimestamp,
      isBooked: model.isBooked,
      scheduleDetails: model.scheduleDetails.map((x) => fromDetail(x)).toList(),
    );
    return scheduleentity;
  }

  @override
  ScheduleDetailEntity fromDetail(ScheduleDetails scheduleDetails) {
    final scheduledetailentity = ScheduleDetailEntity(
      startPeriodTimestamp: scheduleDetails.startPeriodTimestamp,
      endPeriodTimestamp: scheduleDetails.endPeriodTimestamp,
      id: scheduleDetails.id,
      scheduleId: scheduleDetails.scheduleId,
      startPeriod: scheduleDetails.startPeriod,
      endPeriod: scheduleDetails.endPeriod,
      createdAt: scheduleDetails.createdAt,
      updatedAt: scheduleDetails.updatedAt,
      isBooked: scheduleDetails.isBooked,
    );
    return scheduledetailentity;
  }
}
