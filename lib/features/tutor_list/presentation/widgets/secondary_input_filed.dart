import 'package:flutter/material.dart';

class SecondaryInputField extends StatelessWidget {
  const SecondaryInputField(
      {super.key, required this.placeholder, this.isObsecure = false});
  final String placeholder;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          labelText: placeholder,
        ),
      ),
    );
  }
}
