import 'package:tutor_flutter_app/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/presentation/pages/courses_page.dart';
import 'package:tutor_flutter_app/presentation/pages/history_page.dart';
import 'package:tutor_flutter_app/presentation/pages/login_page.dart';
import 'package:tutor_flutter_app/presentation/pages/schedule_page.dart';
import 'package:tutor_flutter_app/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutor_detail_page.dart';

final routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  TutorListPage.routeName: (context) => const TutorListPage(),
  TutorDetailPage.routeName: (context) => const TutorDetailPage(),
  SchedulePage.routeName: (context) => const SchedulePage(),
  HistoryPage.routeName: (context) => const HistoryPage(),
  CourseDetailPage.routeName: (context) => const CourseDetailPage(),
  CoursesPage.routeName: (context) => const CoursesPage(),
  TopicDetailPage.routeName: (context) => const TopicDetailPage(),
};
