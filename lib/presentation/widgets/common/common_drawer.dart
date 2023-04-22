import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/presentation/pages/courses_page.dart';
import 'package:tutor_flutter_app/presentation/pages/history_page.dart';
import 'package:tutor_flutter_app/presentation/pages/schedule_page.dart';
import 'package:tutor_flutter_app/presentation/pages/splash_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CommonColor.lightBlue,
            ),
            child: SvgPicture.asset(
              "assets/images/lettutor_logo.svg",
              semanticsLabel: 'LetTutor Logo',
            ),
          ),
          ListTile(
            title: _buildTextRow(
                text: 'Tutor',
                icon: const FaIcon(FontAwesomeIcons.graduationCap)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const TutorListPage()),
                  (route) => false);
            },
          ),
          ListTile(
            title: _buildTextRow(
                text: 'Schedule', icon: const Icon(Icons.bookmark)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SchedulePage()),
                  (route) => false);
            },
          ),
          ListTile(
            title:
                _buildTextRow(text: 'History', icon: const Icon(Icons.history)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryPage()),
                  (route) => false);
            },
          ),
          ListTile(
            title: _buildTextRow(
                text: 'Course', icon: const FaIcon(FontAwesomeIcons.bookOpen)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const CoursesPage()),
                  (route) => false);
            },
          ),
          ListTile(
            title: _buildTextRow(
                text: 'Sign out',
                icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SplashPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow({required Widget icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
