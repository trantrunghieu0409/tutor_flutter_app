import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    var width = 40.0;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/images/facebook_logo.svg",
            semanticsLabel: "facebook",
            width: width,
          ),
          SvgPicture.asset(
            "assets/images/google_logo.svg",
            semanticsLabel: "google",
            width: width,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 22,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: SvgPicture.asset(
                "assets/images/mobile_logo.svg",
                semanticsLabel: "mobile",
                width: width - 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
