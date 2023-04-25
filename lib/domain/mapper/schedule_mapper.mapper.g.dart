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
    );
    return scheduleentity;
  }
}
