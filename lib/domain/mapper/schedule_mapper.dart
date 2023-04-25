import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/schedule_resp.dart';
import 'package:tutor_flutter_app/domain/entities/schedule/schedule_entity.dart';

part 'schedule_mapper.mapper.g.dart';

@Mapper()
abstract class ScheduleMapper {
  ScheduleEntity fromModel(ScheduleOfTutor model);
}
