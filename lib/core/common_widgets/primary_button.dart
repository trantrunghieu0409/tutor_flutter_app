import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.text, required this.onPressed});
  final String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(48)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ));
  }
}
