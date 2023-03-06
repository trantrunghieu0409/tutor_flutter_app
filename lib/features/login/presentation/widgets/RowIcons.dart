import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    var iconWidth = 40.0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/images/facebook_logo.svg",
            semanticsLabel: "facebook",
            width: iconWidth,
          ),
          SvgPicture.asset(
            "assets/images/google_logo.svg",
            semanticsLabel: "google",
            width: iconWidth,
          ),
          SvgPicture.asset(
            "assets/images/mobile_logo.svg",
            semanticsLabel: "mobile",
            width: iconWidth,
          )
        ],
      ),
    );
  }
}
