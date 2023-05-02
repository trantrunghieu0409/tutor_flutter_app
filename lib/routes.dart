import 'package:tutor_flutter_app/chatgpt/src/presentation/pages/main_chat_page.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/presentation/controllers/settings_controller.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/register_page.dart';
import 'package:tutor_flutter_app/presentation/pages/course_detail_page.dart';
import 'package:tutor_flutter_app/presentation/pages/courses_page.dart';
import 'package:tutor_flutter_app/presentation/pages/history_page.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/login_page.dart';
import 'package:tutor_flutter_app/presentation/pages/profile_page.dart';
import 'package:tutor_flutter_app/presentation/pages/schedule_page.dart';
import 'package:tutor_flutter_app/presentation/pages/setting_page.dart';
import 'package:tutor_flutter_app/presentation/pages/topic_detail_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutor_detail_page.dart';

final routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  SettingPage.routeName: (context) =>
      SettingPage(controller: Injector.resolve<SettingsController>()),
  TutorListPage.routeName: (context) => const TutorListPage(),
  TutorDetailPage.routeName: (context) => const TutorDetailPage(),
  SchedulePage.routeName: (context) => const SchedulePage(),
  HistoryPage.routeName: (context) => const HistoryPage(),
  CourseDetailPage.routeName: (context) => const CourseDetailPage(),
  CoursesPage.routeName: (context) => const CoursesPage(),
  TopicDetailPage.routeName: (context) => const TopicDetailPage(),
  MainChatPage.routeName: (context) => const MainChatPage(),
};
