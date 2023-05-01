import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/tutors_resp.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/feedback_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/first_info_entity.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';

part 'tutor_mapper.mapper.g.dart';

@Mapper()
abstract class TutorMapper {
  TutorEntity fromModel(Rows model);
  FeedbackEntity fromFeedback(Feedbacks feedback);
  InfoEntity fromFirstInfo(FirstInfo firstInfo);
  InfoEntity fromSecondInfo(SecondInfo secondInfo);
}
