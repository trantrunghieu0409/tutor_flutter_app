import 'package:tutor_flutter_app/domain/entities/course/course_entity.dart';

class CourseResult {
  late int total;
  late List<CourseEntity> courses;

  CourseResult({this.total = 0, this.courses = const []});
}
