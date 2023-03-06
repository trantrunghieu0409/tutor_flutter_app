import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        "Say hello to your English tutors",
        style: TextStyle(
          fontSize: 28.0,
          color: Color.fromRGBO(0, 113, 240, 1.0),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}

class TextSubheader extends StatelessWidget {
  const TextSubheader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Become fluent faster through one on one video chat lessons tailored to your goals.',
      style: TextStyle(fontSize: 16.0),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Not a member yet? "),
        TextLink(
          text: "Sign up",
          link:
              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
        )
      ],
    );
  }
}

class TextLink extends StatelessWidget {
  const TextLink({super.key, required this.link, required this.text});
  final String link;
  final String text;

  Future<void> _launchUrl() async {
    Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.blue,
        child: Text(
          text,
          style: const TextStyle(
              decoration: TextDecoration.underline, color: Colors.blue),
        ),
        onTap: () => _launchUrl());
  }
}
