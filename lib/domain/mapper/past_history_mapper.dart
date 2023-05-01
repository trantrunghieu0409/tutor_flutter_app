import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/past_history_resp.dart';
import 'package:tutor_flutter_app/domain/entities/history/past_history_entity.dart';
import 'package:tutor_flutter_app/domain/entities/history/tutor_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/first_info_entity.dart';

part 'past_history_mapper.mapper.g.dart';

@Mapper()
abstract class PastHistoryMapper {
  PastHistoryEntity fromModel(Rows model);
  TutorInfoEntity fromTutorInfo(TutorInfo tutorInfo);
  FeedbackEntity fromFeedback(Feedbacks feedbacks);
  InfoEntity fromSecondInfo(SecondInfo secondInfo);
}
