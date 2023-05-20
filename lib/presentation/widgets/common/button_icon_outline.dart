import 'package:flutter/material.dart';

class ButtonIconOutline extends StatelessWidget {
  const ButtonIconOutline(
      {super.key, required this.labelText, required this.icon, this.callback});
  final String labelText;
  final Widget icon;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: callback,
      icon: icon,
      label: Text(labelText),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.blue)))),
    );
  }
}
