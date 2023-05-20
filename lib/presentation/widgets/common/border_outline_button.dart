import 'package:flutter/material.dart';

class BorderOutlineButton extends StatelessWidget {
  const BorderOutlineButton(
      {super.key,
      this.color = Colors.red,
      this.backgroundColor = Colors.white,
      required this.labelText,
      required this.icon,
      this.onPressed});

  final Color color;
  final Color backgroundColor;
  final String labelText;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        // backgroundColor: Colors.white,// background
        foregroundColor: color,
        backgroundColor: backgroundColor,
        side: BorderSide(color: color), // foreground border
      ),
      onPressed: onPressed ?? () => {},
      label: Text(labelText),
      icon: Icon(icon),
    );
  }
}
