import 'package:tutor_flutter_app/core/utils/datetime_utils.dart';
import 'package:tutor_flutter_app/domain/entities/history/history_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/schedule_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';

class TutorHistoryEntity {
  late TutorInfoEntity tutorInfo;
  List<HistoryEntity> histories;
  late List<ScheduleInfoEntity> scheduleHitories;
  late DateTime date;

  TutorHistoryEntity(
      {required this.tutorInfo,
      required this.histories,
      required this.scheduleHitories,
      required this.date});

  String getCurrentMeeting() {
    int index = scheduleHitories.indexWhere((element) =>
        element.startTimestamp <= DateTimeUtils.getTimestamp(DateTime.now()) &&
        element.endTimestamp >= DateTimeUtils.getTimestamp(DateTime.now()));

    if (index == -1) return "";
    return histories[index].studentMeetingLink;
  }

  int get startTimestamp =>
      scheduleHitories.isEmpty ? 0 : scheduleHitories.first.startTimestamp;
  int get endTimestamp =>
      scheduleHitories.isEmpty ? 0 : scheduleHitories.last.endTimestamp;
}
