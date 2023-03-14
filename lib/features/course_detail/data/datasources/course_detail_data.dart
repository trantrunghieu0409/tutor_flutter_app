import 'package:tutor_flutter_app/features/course_detail/data/models/course_detail.dart';
import 'package:tutor_flutter_app/features/course_detail/data/models/topic.dart';
import 'package:tutor_flutter_app/features/courses/data/datasources/courses_data.dart';
import 'package:tutor_flutter_app/features/tutorList/data/datasources/tutor_datasource.dart';

var topics = [
  Topic(name: "Foods you love"),
  Topic(name: "Your job"),
  Topic(name: "Playing and Watching Sports"),
  Topic(name: "The Best Pet"),
  Topic(name: "Having Fun in Your Free Time"),
];

var courseDetail = CourseDetail(
    course: courses.first,
    reason:
        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
    purpose: "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
    topics: topics,
    suggestedTutors: [tutors.first]);
