import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/injection/injector.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/presentation/pages/courses_page.dart';
import 'package:tutor_flutter_app/presentation/pages/history_page.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/login_page.dart';
import 'package:tutor_flutter_app/presentation/pages/schedule_page.dart';
import 'package:tutor_flutter_app/presentation/pages/tutors_page.dart';
import 'package:tutor_flutter_app/presentation/providers/authentication_validator.dart';
import 'package:tutor_flutter_app/presentation/providers/user_notifier.dart';

class CommonDrawer extends ConsumerWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AutheticationValidator autheticationValidator =
        Injector.resolve<AutheticationValidator>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: SettingUtils.isLightTheme ? Colors.white : Colors.black12,
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
              autheticationValidator.logOut();
              ref.watch(userProvider.notifier).clearState();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
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
