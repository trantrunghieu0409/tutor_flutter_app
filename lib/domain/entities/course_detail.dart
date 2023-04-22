import 'package:tutor_flutter_app/domain/entities/course.dart';
import 'package:tutor_flutter_app/domain/entities/topic.dart';
import 'package:tutor_flutter_app/domain/entities/tutor.dart';

class CourseDetail {
  Course course;
  String reason;
  String purpose;
  List<Topic> topics;
  List<Tutor> suggestedTutors;

  CourseDetail(
      {required this.course,
      required this.reason,
      required this.purpose,
      this.topics = const [],
      this.suggestedTutors = const []});
}
