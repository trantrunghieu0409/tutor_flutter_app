import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        "assets/images/lettutor_logo.svg",
        semanticsLabel: 'LetTutor Logo',
        width: 150,
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.headphones))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
