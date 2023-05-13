import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor_flutter_app/core/utils/settings_utils.dart';
import 'package:tutor_flutter_app/presentation/pages/setting_page.dart';

class PreviousAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PreviousAppBar({super.key, this.callback});

  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: callback,
      ),
      title: SvgPicture.asset(
        "assets/images/lettutor_logo.svg",
        semanticsLabel: 'LetTutor Logo',
        width: 140,
      ),
      backgroundColor:
          SettingUtils.isLightTheme ? Colors.white : Colors.black12,
      actions: [
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
