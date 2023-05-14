import 'package:tutor_flutter_app/features/course_detail/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/features/courses/presentation/pages/courses_page.dart';
import 'package:tutor_flutter_app/features/history/presentation/pages/history_page.dart';
import 'package:tutor_flutter_app/features/login/presentation/pages/login_page.dart';
import 'package:tutor_flutter_app/features/schedule/presentation/pages/schedule_page.dart';
import 'package:tutor_flutter_app/features/topic_detail/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/features/tutor_list/presentation/pages/tutor_list_page.dart';
import 'package:tutor_flutter_app/features/tutot_detail/presentation/pages/tutor_detail_page.dart';

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
