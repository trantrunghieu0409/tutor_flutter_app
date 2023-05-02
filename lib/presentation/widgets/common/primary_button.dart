import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed, this.backgroundColor = Colors.blue});
  final String text;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
            minimumSize: const Size.fromHeight(48)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ));
  }
}
