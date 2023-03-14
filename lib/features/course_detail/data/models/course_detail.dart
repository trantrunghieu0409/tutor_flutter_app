import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';
import 'package:tutor_flutter_app/features/courses/data/models/course.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';

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
