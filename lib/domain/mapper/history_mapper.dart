import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/history_resp.dart';
import 'package:tutor_flutter_app/data/models/response/past_history_resp.dart'
    as past;
import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/schedule_detail_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/schedule_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';

part 'history_mapper.mapper.g.dart';

@Mapper()
abstract class HistoryMapper {
  HistoryEntity fromModel(Rows model);
  ScheduleDetailInfoEntity fromScheduleDetailInfo(
      ScheduleDetailInfo scheduleDetailInfo);
  ScheduleInfoEntity fromScheduleInfo(ScheduleInfo scheduleInfo);
  TutorInfoEntity fromTutorInfo(TutorInfo data);
}
