import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
