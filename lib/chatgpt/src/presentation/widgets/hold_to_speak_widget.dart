import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HoldToSpeakWidget extends StatelessWidget {
  const HoldToSpeakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        FloatingActionButton(
          child: const FaIcon(FontAwesomeIcons.microphone),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Hold to speak"),
        ),
      ]),
    );
  }
}
