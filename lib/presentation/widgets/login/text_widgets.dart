import 'package:flutter/material.dart';
import 'package:tutor_flutter_app/presentation/pages/authentication/register_page.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 32.0,
          color: Color.fromRGBO(0, 113, 240, 1.0),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.start,
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
      textAlign: TextAlign.start,
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

  Future<void> _launchUrl(BuildContext context) async {
    Navigator.pushNamed(context, RegisterPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          focusColor: Colors.blue,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.blue),
          ),
          onTap: () => _launchUrl(context)),
    );
  }
}
