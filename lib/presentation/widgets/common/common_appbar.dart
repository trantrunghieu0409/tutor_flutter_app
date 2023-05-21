import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/presentation/pages/profile_page.dart';
import 'package:tutor_flutter_app/presentation/pages/setting_page.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, this.callback});

  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        onPressed: callback,
      ),
      title: SvgPicture.asset(
        "assets/images/lettutor_logo.svg",
        semanticsLabel: 'LetTutor Logo',
        width: 140,
      ),
      backgroundColor: SettingUtils.isLightTheme
          ? Colors.white
          : Theme.of(context).scaffoldBackgroundColor,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfilePage.routeName);
            },
            icon: const Icon(
              Icons.person_pin_rounded,
              color: Colors.blue,
            )),
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingPage.routeName);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
