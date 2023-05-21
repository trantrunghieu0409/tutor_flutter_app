import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        maxLines: 2,
      ),
    );
  }
}

class TextSubheader extends StatelessWidget {
  const TextSubheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.login_desc,
      style: const TextStyle(fontSize: 16.0),
      textAlign: TextAlign.start,
      softWrap: true,
    );
  }
}

class TextLink extends StatelessWidget {
  const TextLink({super.key, required this.onClick, required this.text});
  final String text;

  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.blue),
        ),
      ),
    );
  }
}
