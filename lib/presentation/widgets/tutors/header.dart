import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tutor_flutter_app/core/constants/common_color.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_icon_outline.dart';

import 'schedule.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: const BoxDecoration(gradient: CommonColor.linearBlue),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Upcoming lesson",
                style: CommonTextStyle.h1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Schedule(),
                ButtonIconOutline(
                    labelText: "Enter Meeting",
                    icon: FaIcon(FontAwesomeIcons.youtube))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Total lesson time is 295 hours 50 minutes",
              style: CommonTextStyle.body,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
